<?php

namespace App\Http\Controllers;

use App\Models\Pembelian;
use App\Models\PembelianDetail;
use App\Models\Penjualan;
use App\Models\PenjualanDetail;
use Illuminate\Http\Request;
use Barryvdh\DomPDF\Facade\Pdf;


class LaporanController extends Controller
{
    public function index()
    {
        $tanggalawal = date('Y-m-d', mktime(0,0,0, date('m'), 1, date('Y')));
        $tanggalakhir = date('Y-m-d');

        return view('laporan.index', compact('tanggalawal','tanggalakhir'));

    }

    public function getData($awal, $akhir)
    {
        $no = 1;
        $data = array();
        $pendapatan = 0;
        $total_pendapatan = 0;


        while (strtotime($awal) <= strtotime($akhir)) {
            $tanggal = $awal;
            $awal = date('Y-m-d', strtotime("+1 day", strtotime($awal)));

            $total_penjualan = Penjualan::where('created_at', 'LIKE', "%$tanggal%")->sum('bayar');
            $total_pembelian = Pembelian::where('created_at', 'LIKE', "%$tanggal%")->sum('bayar');



            $pendapatan = $total_penjualan - $total_pembelian;
            $total_pendapatan += $pendapatan;





            $row = array();
            $row['DT_RowIndex'] = $no++;
            $row['tanggal'] = tanggal_indonesia($tanggal);
            $row['penjualan'] = format_uang($total_penjualan);
            $row['pembelian'] = format_uang($total_pembelian);
            $row['pendapatan'] = format_uang($pendapatan);



            $data[] = $row;
        }
        $data[] = [
            'DT_RowIndex' => '',
            'tanggal' => '',
            'pembelian' => '',
            'penjualan' => 'Total Pendapatan',
            'pendapatan' => format_uang($total_pendapatan),

        ];

        return $data;
    }

    public function data($awal, $akhir)
    {
        $data = $this->getData($awal,$akhir);
        return datatables()
            ->of($data)
            ->make(true);
    }
    public function refresh(Request $request)
    {
        $tanggalawal = $request->tanggal_awal;
        $tanggalakhir = $request->tanggal_akhir;

        return view('laporan.index', compact('tanggalawal','tanggalakhir'));
    }

    public function exportPDF($awal, $akhir)
    {
        $data= $this->getData($awal, $akhir);
        $pdf  = PDF::loadView('laporan.pdf', compact('awal', 'akhir', 'data'));
        $pdf->setPaper('a4', 'potrait');

        return $pdf->stream('Laporan-pendapatan-'. date('Y-m-d-his') .'.pdf');
    }


}
