@extends('mudir.layout')
@section('content')
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">
                فواتير المشتريات
                <a class="btn btn-primary pull-left" href="{{ route('purchase.create') }}">اضافة جديد</a>
            </h1>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            {{ alert($errors) }}
            <div class="panel panel-default">
                <div class="table-responsive">
                    <table id="example1" class="table table-bordered table-striped dt-responsive nowrap">
                        <thead>
                            <tr>
                                <th width="10%">#</th>
                                <th>اسم المورد</th>
                                <th>اسم  المخزن</th>
                                <th>تاريخ الفاتوره </th>
                                <th>اجمالي الفاتوره  </th>
                                <th>رقم الاذن   </th>
                                <th width="10%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($purchases as $purchase)
                            <tr>
                                <td>{{ $purchase->id }}</td>
                                <td>{{ $purchase->supplier->name }}</td>
                                <td>{{ $purchase->stores->name }}</td>
                                <td>{{ $purchase->date }}</td>
                                <td>{{ $purchase->finalPrice }}</td>
                                <td>{{ (!empty($purchase->permission_number)) ? $purchase->permission_number : '-' }}</td>
                                <td>
                                    <div class="btn-group btn-group-sm">
                                        <a href="{{ route('purchase.show', $purchase) }}" class="btn btn-info">عرض</a>
                                        <!-- <a href="{{ route('purchase.edit', $purchase) }}" class="btn btn-info">تحرير</a> -->
                                    </div>
                                </td>
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

@section('scripts')


    <script>
        function confirmDestroy(category_id, category_name)
        {
            var check = confirm(`هل انت متاكد من حذف "${category_name}" ؟`);
            if (check === true) {
                event.preventDefault();
                document.getElementById('destroy-form-'+category_id).submit();
                return true;
            }
            else {
                event.preventDefault();
                return false;
            }
        }
    </script>
@endsection
