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
                <div class="alert alert-info alert-dismissable">
                    <i class="fa fa-check-circle icon">
                        Transaksi Berhasil disimpan !
                    </i>
                </div>
                </div>
                <div class="box-footer">

                    <button class="btn btn-warning" onclick="notaKecil('{{ route('transaksi.nota_kecil') }}', 'Nota Kecil')">Cetak Ulang Nota</button>


                    <a href="{{ route('transaksi.baru') }}" class="btn btn-primary btn-flat">Transaksi Baru</a>
                    <a href="{{ route('penjualan.index') }}" class="btn btn-success btn-flat">Daftar Transaksi</a>
                </div>
        </div>
    </div>
</div>

@include('sweetalert::alert')
@includeIf('penjualan.detail')
@endsection

@push('scripts')
<script>
    function notaKecil(url, title)
    {
        popupCenter(url, title, 720, 675)
    }
    function notaBesar(url, title)
    {
        popupCenter(url, title, 720, 675)
    }

    function popupCenter(url, title, w, h) {
        const dualScreenLeft = window.screenLeft !==  undefined ? window.screenLeft : window.screenX;
        const dualScreenTop  = window.screenTop  !==  undefined ? window.screenTop  : window.screenY;

        const width  = window.innerWidth ? window.innerWidth : document.documentElement.clientWidth ? document.documentElement.clientWidth : screen.width;
        const height = window.innerHeight ? window.innerHeight : document.documentElement.clientHeight ? document.documentElement.clientHeight : screen.height;

        const systemZoom = width / window.screen.availWidth;
        const left       = (width - w) / 2 / systemZoom + dualScreenLeft
        const top        = (height - h) / 2 / systemZoom + dualScreenTop
        const newWindow  = window.open(url, title,
        `
            scrollbars=yes,
            width  = ${w / systemZoom},
            height = ${h / systemZoom},
            top    = ${top},
            left   = ${left}
        `
        );

        if (window.focus) newWindow.focus();
    }

</script>
@endpush
