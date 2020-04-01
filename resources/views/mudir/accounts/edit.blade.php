@extends('mudir.layout')

@section('content')
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">تحرير بيانات المخزن</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    {{ alert($errors) }}
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <form action="{{ route('accounts.update', [$account]) }}" method="post">
                @CSRF
                @method('PUT')
                <div class="row">
                    <div class="col-md-6">

                        <div class="form-group">
                            <label>الاسم</label>
                            <input class="form-control" name="name" value="{{ $account->name }}">
                        </div>

                    </div>
                </div>
                <button type="submit" class="btn btn-success">تحديث</button>
            </form>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
</div>
@stop
