@extends('mudir.layout')
@section('content')
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">اضافة مورد جديد</h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    {{ alert($errors) }}
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <form action="{{ route('supplier.store') }}" method="post">
                @CSRF
                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>اسم الورد</label>
                            <input class="form-control" name="name">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>العنوان</label>
                            <input class="form-control" name="adress">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>رقم الهاتف</label>
                            <input class="form-control" name="phone_number">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>رقم الارضي</label>
                            <input class="form-control" name="ground_number">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>رقم الفاكس</label>
                            <input class="form-control" name="fax_number">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>البريد الالكتروني</label>
                            <input class="form-control" name="email">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>عميل</label>
                            <div class="checkbox">
                                <input id="type" type="checkbox" name="type" value="client" style="margin-right: 0px;">
                                <label for="type">
                                    اضافة الي قائمة العملاء
                                </label>
                            </div>
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
