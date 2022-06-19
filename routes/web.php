<?php

use App\Http\Controllers\DashboardController;
use App\Http\Controllers\ItemController;
use App\Http\Controllers\KategoriControler;
use App\Http\Controllers\LaporanController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\MemberController;
use App\Http\Controllers\PembelianController;
use App\Http\Controllers\PembelianDetailController;
use App\Http\Controllers\PenjualanController;
use App\Http\Controllers\PenjualanDetailControler;
use App\Http\Controllers\ProdukController;
use App\Http\Controllers\SupplierController;
use App\Http\Controllers\UserController;
use App\Models\PembelianDetail;
use App\Models\Penjualan;
use Illuminate\Support\Facades\Route;
use SebastianBergmann\CodeCoverage\Report\Html\Dashboard;
use App\Http\Middleware\Ceklevel;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', fn () => redirect()->route('login'));

Route::group(['middleware' => 'revalidate'], function(){
route::controller(LoginController::class)->group(function () {
    route::get('/','index')->name('login');
    route::post('login/proses','proses');
    route::get('logout','logout');
});





route::group(['middleware' => 'auth'], function() {

    route::get('/dashboard',[DashboardController::class,'index'])->name('dashboard');
    route::get('/kategori/data', [KategoriControler::class, 'data'])->name('kategori.data');
    route::resource('/kategori', KategoriControler::class);

    route::get('/produk/data', [ProdukController::class, 'data'])->name('produk.data');
    route::post('/produk/delete-selected', [ProdukController::class, 'deleteSelected'])->name('produk.delete_selected');
    route::post('/produk/cetak-barcode', [ProdukController::class, 'cetakBarcode'])->name('produk.cetak_barcode');
    route::resource('/produk', ProdukController::class);

    route::get('/supplier/data', [SupplierController::class, 'data'])->name('supplier.data');
    route::resource('/supplier', SupplierController::class);


    route::get('/item/data', [ItemController::class, 'data'])->name('item.data');
    route::resource('/item', ItemController::class);

    route::get('/pembelian/data', [PembelianController::class, 'data'])->name('pembelian.data');
    route::get('/pembelian/{id}/create', [PembelianController::class, 'create'])->name('pembelian.create');
    route::resource('/pembelian', PembelianController::class)
    ->except('create');

    Route::get('/pembelian_detail/{id}/data', [PembelianDetailController::class, 'data'])->name('pembelian_detail.data');
        Route::get('/pembelian_detail/loadform/{diskon}/{total}', [PembelianDetailController::class, 'loadForm'])->name('pembelian_detail.load_form');
        Route::resource('/pembelian_detail', PembelianDetailController::class)
            ->except('create', 'show', 'edit');

    route::get('/member/data', [MemberController::class, 'data'])->name('member.data');
    route::resource('/member', MemberController::class);
    route::post('/member/cetak-member', [MemberController::class, 'cetakMember'])->name('member.cetak_member');

    route::get('/penjualan/data', [PenjualanController::class, 'data'])->name('penjualan.data');
    route::get('/penjualan', [PenjualanController::class,'index'])->name('penjualan.index');
    route::get('/penjualan/{id}', [PenjualanController::class,'show'])->name('penjualan.show');
    route::delete('/penjualan/{id}', [PenjualanController::class,'destroy'])->name('penjualan.destroy');


    route::get('/transaksi/baru', [PenjualanController::class,'create'])->name('transaksi.baru');
    route::post('/transaksi/simpan', [PenjualanController::class,'store'])->name('transaksi.simpan');


    route::get('/transaksi/gagal', [PenjualanController::class,'gagal'])->name('transaksi.gagal');

    route::get('/transaksi/selesai', [PenjualanController::class,'selesai'])->name('transaksi.selesai');
    route::get('/transaksi/nota-kecil', [PenjualanController::class,'notaKecil'])->name('transaksi.nota_kecil');
    route::get('/transaksi/nota-besar', [PenjualanController::class,'notaBesar'])->name('transaksi.nota_besar');

    route::get('/transaksi/{id}/data', [PenjualanDetailControler::class,'data'])->name('transaksi.data');
    route::get('/transaksi/loadform/{diskon}/{total}/{diterima}', [PenjualanDetailControler::class,'loadForm'])->name('transaksi.load_form');
    Route::resource('/transaksi', PenjualanDetailControler::class)
    ->except('show');




    route::get('/laporan',[LaporanController::class,'index'])->name('laporan.index');
    route::get('/laporan/refresh',[LaporanController::class,'refresh'])->name('laporan.refresh');
    route::get('/laporan/data/{awal}/{akhir}',[LaporanController::class,'data'])->name('laporan.data');
    route::get('/laporan/pdf/{awal}/{akhir}',[LaporanController::class,'exportpdf'])->name('laporan.export_pdf');


    route::get('/profil',[UserController::class,'profil'])->name('user.profil');
    route::post('/profil',[UserController::class,'updateProfil'])->name('user.update_profil');




});

    route::group(['middleware' => 'level:1'], function() {
    Route::get('/user/data', [UserController::class, 'data'])->name('user.data');
    Route::resource('/user', UserController::class);
    });
});


