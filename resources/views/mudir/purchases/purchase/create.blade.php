@extends('mudir.layout')
@section('content')
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">اضافة فاتوره مشتريات</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    {{ alert($errors) }}
    <!-- /.row -->

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
            type="text/javascript"></script>
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css"
          rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js"></script>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    انشاء فاتورة
                </div>
                <div id="app">
                    <purchase-component></purchase-component>
                </div>
                <!-- /.panel-body -->
            </div>


        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
</div>
@stop

@section('scripts')
<script src="{{asset('js/app.js')}}" ></script>
@endsection
