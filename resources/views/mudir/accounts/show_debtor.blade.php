@extends('mudir.layout')
@section('content')
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">معلومات حساب "{{ $account->name }}"</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>

    {{ alert($errors) }}

    <!-- /.row -->
        <div class="row">

            <div class="col-lg-12">

                <div class="panel panel-default">
                    <div class="panel-heading">بيانات الحساب</div>
                    <div class="panel-body">
                        <hr/>
                        <div class="panel panel-default">
                            <div class="table-responsive">
                                <table id="example1" class="table table-bordered table-striped dt-responsive nowrap">
                                    <thead>
                                    <tr>
                                        <th width="30%">البيان</th>
                                        <th width="15%">التصنيف</th>
                                        @if($type == 'creditor')
                                            <th width="15%">قبض</th>
                                        @else
                                            <th width="15%">صرف</th>
                                        @endif
                                        <th width="20%">التاريخ</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    @foreach($account->statements->where('statement_type', $type) as $statement)
                                        <tr>
                                            <td>{{ $statement->statement }}</td>
                                           <td>@if($statement->type == 1) {{ $statement->cat['title'] }} @else {{ $statement->supplier['name'] }} @endif</td>
                                            @if($type == 'creditor')
                                                <td>@if($statement->statement_type == 'creditor') {{ $statement->amount }} @endif</td>
                                            @else
                                                <td>@if($statement->statement_type == 'debtor') {{ $statement->amount }} @endif</td>
                                            @endif
                                            <td>{{ $statement->created_at }}</td>
                                        </tr>
                                    @endforeach
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel -->

                    </div>
                </div>

            </div>
        </div>
        <!-- /.row -->
    </div>
@stop
