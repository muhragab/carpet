@extends('mudir.layout')
@section('content')
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    تفاصيل التقرير
                </h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.$creditor -->
        <div class="row">
            <h4 style="text-align: center">المقبوضات</h4>
            <div class="col-lg-12">
                {{ alert($errors) }}
                <div class="panel panel-default">
                    <div class="table-responsive">
                        <table id="example1" class="table table-bordered table-striped dt-responsive nowrap">
                            <thead>
                            <tr>
                                <td>#</td>
                                <td>المخزن</td>
                                <td>بيانات</td>
                                <td>تاريخ</td>
                                <td>المبلغ</td>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($debtors as $debtorData)
                                <tr>
                                    <td>{{ $debtorData->id}}</td>
                                    <td>{{ $debtorData->account['name'] }}</td>
                                    <td>{{ $debtorData->statement }}</td>
                                    <td>{{ $debtorData->date }}</td>
                                    <td>{{ $debtorData->amount }}</td>
                                </tr>
                            @endforeach
                            </tbody>
                        </table>
                    </div>
                    <!-- /.table-responsive -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        
    </div>
@stop


