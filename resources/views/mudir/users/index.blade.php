@extends('mudir.layout')
@section('content')
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">
                المستخدمين
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
                                <th width="65%">البريد الالكتروني</th>
                                <th width="10%">نوع الحساب</th>
                                <th width="10%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($users as $user)
                            <tr>
                                <td>{{ $user->id }}</td>
                                <td>{{ $user->name }}</td>
                                <td>{{ $user->email }}</td>
                                <td>{{ $user->role_ar }}</td>
                                <td>
                                    <div class="btn-group btn-group-xs">

                                    <a href="{{ route('user.edit', $user) }}" class="btn btn-info">تحرير</a>

                                    </div>

                                    <form id="destroy-form-{{ $user->id }}"
                                          action="{{ route('user.destroy', [$user->id]) }}"
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
