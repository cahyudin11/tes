@extends('layouts.master')

@section('title')
    Transaksi Penjualan
@endsection

@section('breadcrumb')
    @parent
    <li class="active">Transasi Penjualan</li>
@endsection

@section('content')
<div class="row">
    <div class="col-lg-12">
        <div class="box">
            <div class="box-body table-responsive">
                <div class="alert alert-danger alert-dismissable">
                    <i class="fa fa-exclamation-triangle icon">
                        Gagal ! Stok Kurang Dari Jumlah Pemesanan, Silakan Klik Transaksi Baru !
                    </i>
                </div>
                </div>
                <div class="box-footer">

                  <a href="{{ route('transaksi.baru') }}" class="btn btn-primary btn-flat">Transaksi Baru</a>

                </div>
        </div>
    </div>
</div>

@include('sweetalert::alert')
@includeIf('penjualan.detail')
@endsection


