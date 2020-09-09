@extends('mudir.layout')
@section('content')
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    فواتير المبيعات
                    <a class="btn btn-primary pull-left" href="{{ route('sales.create') }}">اضافة جديد</a>
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
                                <th> اسم المخزن</th>
                                <th>رقم الاذن</th>
                                <th>اسم المندوب</th>
                                <th> اجمالي الفاتوره</th>
                                <th>التاريخ</th>
                                <th width="10%"></th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($sales as $sale)
                                <tr>
                                    <td>{{ $sale->id }}</td>
                                    <td>{{ $sale->supplier->name }}</td>
                                    <td>{{ $sale->stores->name }}</td>
                                    <td>{{ (!empty($sale->permission_number)) ? $sale->permission_number : '-' }}</td>
                                    <td>{{ $sale->saleMan->name }}</td>
                                    <td>{{ $sale->finalPrice }}</td>
                                    <td>{{ $sale->date }}</td>
                                    <td>
                                        <div class="btn-group btn-group-sm">
                                            <a href="{{ route('sales.show', $sale) }}"
                                               class="btn btn-info">عرض</a>
                                        </div>
                                        <div class="btn-group btn-group-sm">
                                            @if($sale->status ==1 )
                                                <a href="{{ route('sales.edit', $sale) }}" class="btn btn-info">اعتماد</a>

                                            @endif
                                        </div>

                                        <div class="btn-group btn-group-sm">
                                            @if($sale->status ==1 )
                                                <a
                                                        href="{{ route('sales.delete', $sale) }}"
                                                        class="btn btn-info">حذف</a>
                                            @endif
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
        function confirmDestroy(category_id, category_name) {
            var check = confirm(`هل انت متاكد من حذف "${category_name}" ؟`);
            if (check === true) {
                event.preventDefault();
                document.getElementById('destroy-form-' + category_id).submit();
                return true;
            } else {
                event.preventDefault();
                return false;
            }
        }
    </script>
@endsection
