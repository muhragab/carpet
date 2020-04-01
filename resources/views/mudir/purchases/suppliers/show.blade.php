@extends('mudir.layout')
@section('content')
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">
                المعلومات
                <a class="btn btn-info pull-left" href="{{ route('supplier.edit', [$supplier]) }}">تعديل المعلومات</a>
            </h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    {{ alert($errors) }}
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-6">

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>الاسم</label>
                        <p>{{ $supplier->name }}</p>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>العنوان</label>
                        <p>{{ $supplier->adress }}</p>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>رقم الهاتف</label>
                        <p>{{ $supplier->phone_number }}</p>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>رقم الارضي</label>
                        <p>{{ $supplier->ground_number }}</p>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>رقم الفاكس</label>
                        <p>{{ $supplier->fax_number }}</p>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>البريد الالكتروني</label>
                        <p>{{ $supplier->email }}</p>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4">
                    <div class="form-group">
                        <label>اضافة الي :-</label>
                        <div class="checkbox">
                            <input id="type" type="checkbox" name="is_supplier" value="1" style="margin-right: 0px;" @if($supplier->is_supplier) checked @endif disabled>
                            <label for="type">
                                اضافة الي قائمة الموردين
                            </label>
                        </div>

                        <div class="checkbox">
                            <input id="type" type="checkbox" name="is_client" value="1" style="margin-right: 0px;" @if($supplier->is_client) checked @endif disabled>
                            <label for="type">
                                اضافة الي قائمة العملاء
                            </label>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.col-lg-12 -->
        <div class="col-lg-6">
            <div class="panel panel-default">
                <div class="panel-heading">الحسابات ({{ $supplier->account->count() }})</div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>المبلغ</th>
                                    <th>نوع العملية</th>
                                    <th>وصف</th>
                                    <th>الوقت</th>
                                </tr>
                            </thead>
                            <tbody>
                                @if($supplier->account->count() != 0)
                                @foreach($supplier->account as $i)
                                <tr class="@if($i->type == 'credit') success @else info @endif">
                                    <td>{{ $i->balance }}</td>
                                    <td>{{ $i->type }}</td>
                                    <td>{{ $i->description }}</td>
                                    <td>{{ $i->created_at }}</td>
                                </tr>
                                @endforeach
                                @endif
                            </tbody>
                        </table>
                    </div>
                    <!-- /.table-responsive -->
                    <p><b>المدين</b> {{ $credit }}</p>
                    <p><b>الدائن</b> {{ $deposit }}</p>
                </div>
                <!-- /.panel-body -->
            </div>
        </div>
    </div>
    <!-- /.row -->
</div>
@stop
