@extends('mudir.layout')
@section('content')
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">
                الموردين
                <a class="btn btn-primary pull-left" href="{{ route('supplier.create') }}">اضافة جديد</a>
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
                                <th>اسم</th>
                                <th width="10%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($suppliers as $supplier)
                            <tr>
                                <td>{{ $supplier->id }}</td>
                                <td>{{ $supplier->name }}</td>
                                <td>
                                    <div class="btn-group btn-group-sm">

                                    <a href="{{ route('supplier.edit', $supplier) }}" class="btn btn-info">نحرير</a>

                                        <a href="{{ route('supplier.destroy', [$supplier]) }}"
                                        onclick="confirmDestroy({{ $supplier->id }}, '{{ $supplier->name }}');"
                                        class="btn btn-danger btn-xs">حذف</a>

                                    </div>

                                    <form id="destroy-form-{{ $supplier->id }}"
                                          action="{{ route('supplier.destroy', [$supplier->id]) }}"
                                          method="POST" style="display: none;">
                                        @csrf
                                        @method ('delete')
                                    </form>
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
