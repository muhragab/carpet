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
                        <form action="{{ route('accounts_statement.store') }}" method="POST"
                              enctype="multipart/form-data">
                            @CSRF
                            <input type="hidden" name="account_id" value="{{ $account->id }}">
                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>نوع البيان</label>
                                        <select class="form-control" name="statement_type">
                                            <option value=>اختيار نوع البيان</option>
                                            <option value="creditor">قبض</option>
                                            <option value="debtor">صرف</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="form-group">
                                        <label>التصنيفات </label>
                                        <select class="form-control" type="text" name="category">
                                            @foreach($subCategory as $sub)
                                                <option value="{{$sub->id}}">{{$sub->title}}</option>
                                            @endforeach
                                            @foreach($Suppliers as $Supplier)
                                                <option value="{{$Supplier->id}}">{{$Supplier->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label>التاريخ</label>
                                        <input class="form-control" type="date" name="date" value="">
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label>بيان الحساب </label>
                                        <input class="form-control" type="text" name="statement">
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="form-group">
                                        <label>مبلغ البيان</label>
                                        <input class="form-control" type="number" name="amount" value="">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-success">اضافة</button>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <hr/>

                    {{--   <div class="panel panel-default">
                           <div class="table-responsive">
                               <table id="example1" class="table table-bordered table-striped dt-responsive nowrap">
                                   <thead>
                                   <tr>
                                       <th width="50%">البيان</th>
                                       <th width="15%">دائن</th>
                                       <th width="15%">مدين</th>
                                       <th width="20%">التاريخ</th>
                                   </tr>
                                   </thead>
                                   <tbody>
                                   @foreach($account->statements as $statement)
                                       <tr>
                                           <td>{{ $statement->statement }}</td>
                                           <td>@if($statement->statement_type == 'creditor') {{ $statement->amount }} @endif</td>
                                           <td>@if($statement->statement_type == 'debtor') {{ $statement->amount }} @endif</td>
                                           <td>{{ $statement->created_at }}</td>
                                       </tr>
                                   @endforeach
                                   </tbody>
                               </table>
                           </div>
                           <!-- /.table-responsive -->
                       </div>--}}
                    <!-- /.panel -->

                    </div>
                </div>

            </div>
        </div>
        <!-- /.row -->
    </div>
@stop
