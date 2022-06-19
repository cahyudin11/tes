@extends('layouts.auth')
@section('login')
<div class="login-box">
    <div class="login-logo">
      <a href="{{ url('/') }}"><b>POS</b>go</a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
      <p class="login-box-msg">silahkan masukan akun anda !</p>

      <form action="{{ url('login/proses') }}" method="post">
          @csrf
        <div class="form-group has-feedback @error('username') has-error @enderror">
          <input type="text" name="username" class="form-control
          @error('username')
            is-invalid
          @enderror
          " placeholder="username"  value="{{ old('username') }}">
          <span class="glyphicon glyphicon-user form-control-feedback"></span>
          @error('username')
            <div class="invalid-feedback">
                {{$message}}
            </div>
          @enderror
        </div>

        <div class="form-group has-feedback @error('password') has-error @enderror">
          <input type="password" name="password" class="form-control
          @error('password')
          is-invalid
          @enderror
          " placeholder="Password">
          <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          @error('password')
          <div class="invalid-feedback">
              {{$message}}
          </div>
        @enderror

        </div>
        <div class="row">
          <div class="col-xs-8">

          </div>
          <!-- /.col -->
          <div class="col-xs-4">
            <button type="submit" class="btn btn-primary btn-block btn-flat">Masuk</button>
          </div>
          <!-- /.col -->
        </div>
      </form>


    </div>
    <!-- /.login-box-body -->
  </div>
@endsection


