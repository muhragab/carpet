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
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>نوع البيان</label>
                                        <select class="form-control" name="statement_type">
                                            <option value=>اختيار نوع البيان</option>
                                            <option value="creditor">قبض</option>
                                            <option value="debtor">صرف</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>التصنيفات </label>
                                        <select class="form-control" onchange="cat()" id="category" type="text">
                                            <option value="">من فضلك اختر تصنيف او عميل / مورد</option>
                                            @foreach($subCategory as $sub)
                                                <option value="{{$sub->id}}">{{$sub->title}}</option>
                                            @endforeach

                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>العملاء والمودرين </label>
                                        <select class="form-control" onchange="suppliers()" id="supplier" type="text">
                                            <option value="">من فضلك اختر تصنيف او عميل / مورد</option>
                                            @foreach($Suppliers as $Supplier)
                                                <option value="{{$Supplier->id}}">{{$Supplier->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <script>
                                    function cat() {
                                        document.getElementById('type').value = 1;
                                        document.getElementById('supplier').value = '';
                                        document.getElementById('category').name = "category";
                                        document.getElementById('supplier').name = "";
                                    }

                                </script>
                                <script>
                                    function suppliers() {
                                        document.getElementById('type').value = 2;
                                        document.getElementById('category').value = '';
                                        document.getElementById('supplier').name = "category";
                                        document.getElementById('category').name = "";
                                    }

                                </script>

                                <input type="hidden" value="" name="type" id="type">
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>التاريخ</label>
                                        <input class="form-control" type="date" name="date" value="">
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-group">
                                        <label>بيان الحساب </label>
                                        <input class="form-control" type="text" name="statement">
                                    </div>
                                </div>
                                <div class="col-md-4">
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

                    </div>
                </div>

            </div>
        </div>
        <!-- /.row -->
    </div>
@stop
