@extends('mudir.layout')
@section('content')
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">انشاء حساب جديد</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    {{ alert($errors) }}
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <form action="{{ route('accounts.store') }}" method="post">
                @CSRF
                <div class="row">
                    <div class="col-md-6">

                        <div class="form-group">
                            <label>الاسم</label>
                            <input class="form-control" name="name" value="">
                        </div>

                    </div>
                </div>
                <button type="submit" class="btn btn-success">اضافة</button>
            </form>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
</div>
@stop
