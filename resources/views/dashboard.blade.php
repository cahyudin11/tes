@extends('layouts/master')

@section('title')
    Dashboard
@endsection

@section('breadcrum')
    @parent
    <li class="active">Dashboard</li>
@endsection

@section('content')
<!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3>{{$kategori}}</h3>

              <p>Kategori</p>
            </div>
            <div class="icon">
              <i class="fa fa-cube"></i>
            </div>
            <a href="{{route('kategori.index')}}" class="small-box-footer">Klik ! Untuk Masuk Ke Menu <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3>{{$produk}}</sup></h3>

              <p>Produk</p>
            </div>
            <div class="icon">
              <i class="fa fa-shopping-basket"></i>
            </div>
            <a href="{{ route('produk.index') }}" class="small-box-footer">Klik ! Untuk Masuk Ke Menu <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3>{{$supplier}}</h3>

              <p>Supplier</p>
            </div>
            <div class="icon">
              <i class="fa fa-truck"></i>
            </div>
            <a href="{{ route('supplier.index') }}" class="small-box-footer">Klik ! Untuk Masuk Ke Menu<i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3>{{$member}}</h3>

              <p>Member</p>
            </div>
            <div class="icon">
              <i class="fa fa-address-card"></i>
            </div>
            <a href="{{ route('member.index') }}" class="small-box-footer">Klik ! Untuk Masuk Ke Menu <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
      </div>
      <!-- /.row -->
      <!-- Main row -->
      <div class="row">
        <div class="col-md-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Grafik Pendapatan {{tanggal_indonesia($tanggal_awal)}} s/d  {{tanggal_indonesia($tanggal_akhir)}}</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div class="row">
                <div class="col-md-12">

                  <div class="chart">
                    <!-- Sales Chart Canvas -->
                    <canvas id="salesChart" style="height: 180px;"></canvas>
                  </div>
                  <!-- /.chart-responsive -->
                </div>
                <!-- /.col -->

                <!-- /.col -->
              </div>
              <!-- /.row -->
            </div>
            <!-- ./box-body -->

            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row (main row) -->
@endsection

@push('scripts')
<!-- ChartJS -->
<script src="{{ asset('AdminLTE-2/bower_components/chart.js/Chart.js') }}"></script>
<script>
    $(function(){
        // Get context with jQuery - using jQuery's .get() method.
      var salesChartCanvas = $('#salesChart').get(0).getContext('2d');
      // This will get the first returned node in the jQuery collection.
      var salesChart       = new Chart(salesChartCanvas);

      var salesChartData = {
        labels  : {{ json_encode($data_tanggal) }},
        datasets: [
          {
            label               : 'Pendapatan',
            fillColor           : 'rgb(210, 214, 222)',
            strokeColor         : 'rgb(210, 214, 222)',
            pointColor          : 'rgb(210, 214, 222)',
            pointStrokeColor    : '#c1c7d1',
            pointHighlightFill  : '#fff',
            pointHighlightStroke: 'rgb(220,220,220)',
            data                :{{ json_encode($data_pendapatan) }}
          }
        ]

      };
      var salesChartOptions = {
        pointDot : true,
        responsive : true
      };

      salesChart.Line(salesChartData, salesChartOptions);

    });
 </script>
@endpush




