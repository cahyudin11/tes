<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="{{url(auth()->user()->foto )}}" class="img-circle img-profil" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>{{ auth()->user()->name}}</p>
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>

      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MENU</li>
            <li>
            <a href="{{route('dashboard')}}">
                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
            </a>
            </li>


            <li>
            <a href="{{ route('supplier.index') }}">
                <i class="fa fa-truck"></i> <span>Supplier</span>
            </a>
            </li>


            <li class="treeview">
                <a href="#">
                    <i class="fa fa-cubes"></i> <span>produk</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu" style="display: none;">
                    <li><a href="{{ route('kategori.index') }}"><i class="fa fa-circle-o"></i>Kategori</a></li>
                    <li><a href="{{ route('produk.index') }}"><i class="fa fa-circle-o"></i>item</a></li>

                </ul>

             <li class="treeview">
              <a href="#">
                  <i class="fa fa-cart-arrow-down"></i> <span>Transaksi</span>
                  <span class="pull-right-container">
                      <i class="fa fa-angle-left pull-right"></i>
                  </span>
              </a>
              <ul class="treeview-menu" style="display: none;">
                  <li><a href="{{  route('pembelian.index') }}"><i class="fa fa-circle-o"></i>Pembelian</a></li>
                  <li><a href="{{ route('penjualan.index') }}"><i class="fa fa-circle-o"></i>Daftar Penjualan</a></li>
                  <li><a href="{{ route('transaksi.baru') }}"><i class="fa fa-circle-o"></i>Tambah Penjualan</a></li>

              </ul>
                    <li>
                    <a href="{{ route('laporan.index') }}">
                        <i class="fa fa-file-pdf-o"></i> <span>Laporan</span>
                    </a>
                    </li>



                @if (auth()->user()->level == 1)
                <li class="header">SETTING</li>
                <li>
                <a href="{{  route('user.index') }}"">
                    <i class="fa fa-users"></i> <span>Akun</span>
                </a>
                </li>

                @endif



            </ul>
        </section>
        <!-- /.sidebar -->
    </aside>
