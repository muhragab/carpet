@extends('mudir.layout')
@section('content')
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    المخازن
                    <a class="btn btn-primary pull-left" href="{{ route('stores.create') }}">اضافة جديد</a>
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
                                <th width="5%">#</th>
                                <th width="10%">الاسم</th>
                                <th width="10%"></th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($stores as $store)
                                <tr>
                                    <td>{{ $store->id }}</td>
                                    <td>{{ $store->name }}</td>
                                    <td>
                                        <form action="{{ route('stores.destroy', [$store]) }}" method="POST">
                                            @csrf
                                            @method('DELETE')

                                            <div class="btn-group btn-group-xs">
                                                <a href="{{url('/show/store/send/'.$store->id)}}" class="btn btn-info">
                                                    <span class="fa fa-fw fa-eye"></span>
                                                    التحويلات الصارده
                                                </a>

                                                <a href="{{url('/show/to/send/'.$store->id)}}" class="btn btn-info">
                                                    <span class="fa fa-fw fa-eye"></span>
                                                    التحويلات الوارده
                                                </a>
                                                <a href="{{ url('/show/in/store/'.$store->id) }}" class="btn btn-info">
                                                    <span class="fa fa-fw fa-edit"></span>
                                                    رصيد اولي
                                                </a>

                                                <a href="{{ route('stores.edit', [$store]) }}" class="btn btn-info">
                                                    <span class="fa fa-fw fa-edit"></span>
                                                    تحرير
                                                </a>

                                                <button type="submit" class="btn btn-danger"
                                                        onclick="return confirm('Are you sure you want to delete it?')">
                                                    <span class="fa fa-fw fa-trash"></span>
                                                    حذف
                                                </button>
                                            </div>
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
