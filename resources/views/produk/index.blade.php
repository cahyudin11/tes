@extends('layouts/master')

@section('title')
    Daftar Produk
@endsection

@section('breadcrum')
    @parent
    <li class="active">Produk</li>
@endsection

@section('content')

      <div class="row">
        <div class="col-md-12">
          <div class="box">
            <div class="box-header with-border">
                <button onclick="addForm('{{ route('produk.store') }}')" class="btn btn-success btn-xs btn-flat"><i class="fa fa-plus-circle"></i> Tambah</button>
                <button onclick="deleteSelected('{{ route('produk.delete_selected') }}')" class="btn btn-danger btn-xs btn-flat"><i class="fa fa-trash"></i> Hapus</button>
                <button onclick="cetakBarcode('{{ route('produk.cetak_barcode') }}')" class="btn btn-info btn-xs btn-flat"><i class="fa fa-barcode"></i> Barcode</button>


                    <a href="{{ route('member.index') }}" class="btn btn-warning btn-xs btn-flat"><i class="fa fa-address-card-o"></i> Member</a>

            </div>
            <div class="box-body table-responsive">
               <form action="" method="POST" class="form-produk">
                   @csrf
                   <table class="table table-stiped table-bordered">
                    <thead>
                        <th>
                            <input type="checkbox" name="select_all" id="select_all">
                        </th>
                        <th width="5%">No</th>
                        <th>kode</th>
                        <th>nama</th>
                        <th>kategori</th>
                        <th>merk</th>
                        <th>harga beli</th>
                        <th>harga jual</th>
                        <th>diskon</th>
                        <th>stok</th>
                        <th width="10%"><i class="fa fa-cog"></i></th>
                    </thead>
                    <tbody></tbody>
                </table>
               </form>
            </div>

          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row (main row) -->
@includeIf('produk.form')
@endsection
@push('scripts')
<script>
    let table;
                $(function () {
                table = $('.table').DataTable({
                    processing: true,
                    autoWidth:false,
                    ajax: {
                        url: '{{ route('produk.data') }}',
                    },
                    columns: [
                        {data: 'select_all'},
                        {data: 'DT_RowIndex', searchable: false, sortable : false},
                        {data: 'kode_produk'},
                        {data: 'nama_produk'},
                        {data: 'nama_kategori'},
                        {data: 'merk'},
                        {data: 'harga_beli'},
                        {data: 'harga_jual'},
                        {data: 'diskon'},
                        {data: 'stok'},
                        {data: 'aksi', searchable: false, sortable : false},

                    ]

                });
                    $('#modal-form').validator().on('submit', function (e){
                        if (! e.preventDefault()) {
                            $.post($('#modal-form form').attr('action'), $('#modal-form form').serialize())
                                .done((response) => {
                                    $('#modal-form').modal('hide');
                                    table.ajax.reload();
                                })
                                .fail((errors) => {
                                    alert('Tidak dapat menyimpan data');
                                    return;
                                });
                        }
                    });
                    $('[name=select_all]').on('click', function (){
                        $(':checkbox').prop('checked', this.checked);
                    });

                });

                function addForm(url) {
                    $('#modal-form').modal('show');
                    $('#modal-form .modal-title').text('Tambah Produk');

                    $('#modal-form form')[0].reset();
                    $('#modal-form form').attr('action', url);
                    $('#modal-form [name=_method]').val('post');
                    $('#modal-form [name=nama_prduk]').focus();
                }

                function editForm(url) {
                    $('#modal-form').modal('show');
                    $('#modal-form .modal-title').text('Edit Produk');

                    $('#modal-form form')[0].reset();
                    $('#modal-form form').attr('action', url);
                    $('#modal-form [name=_method]').val('put');
                    $('#modal-form [name=nama_produk]').focus();

                    $.get(url)
                        .done((response) => {
                            $('#modal-form [name=nama_produk]').val(response.nama_produk);
                            $('#modal-form [name=id_kategori]').val(response.id_kategori);
                            $('#modal-form [name=merk]').val(response.merk);
                            $('#modal-form [name=harga_beli]').val(response.harga_beli);
                            $('#modal-form [name=harga_jual]').val(response.harga_jual);
                            $('#modal-form [name=diskon]').val(response.diskon);
                            $('#modal-form [name=stok]').val(response.stok);
                        })
                        .fail((errors) => {
                            alert('Tidak dapat menampilkan data');
                            return;
                        });
                }

                function deleteData(url) {
                    if (confirm('Yakin ingin menghapus data terpilih?')) {
                        $.post(url, {
                                '_token': $('[name=csrf-token]').attr('content'),
                                '_method': 'delete'
                            })
                            .done((response) => {
                                table.ajax.reload();
                            })
                            .fail((errors) => {
                                alert('Tidak dapat menghapus data');
                                return;
                            })
                    }
                }

                function deleteSelected(url) {
                    if ($('input:checked').length > 1) {
                        if (confirm('Yakin ingin menghapus data terpilih?')) {
                            $.post(url, $('.form-produk').serialize())
                                .done((response) => {
                                    table.ajax.reload();
                                })
                                .fail((errors) => {
                                    alert('Tidak dapat menghapus data');
                                    return;
                                });
                        }
                    } else {
                        alert('Pilih data lebih dari satu !');
                        return;
                    }
                }

                function cetakBarcode(url) {
                    if ($('input:checked').length < 1) {
                        alert('Pilih data yang akan dicetak minimal 1 data !');
                        return;

                    } else {
                        $('.form-produk').attr('target', '_blank') .attr('action', url).submit();
                    }
                }

</script>

@endpush
