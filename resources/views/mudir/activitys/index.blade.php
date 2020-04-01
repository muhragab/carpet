@extends('mudir.layout')
@section('content')
<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">
                النشاط
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
								<th>صاحب النشاط</th>
								<th>النشاط</th>
								<th>تاريح الحدث</th>
							</tr>
						</thead>
						<tbody>
							@foreach($activitys as $activity)
							<tr>
								<td><span class="text-muted">{{ $activity->user->name }}</span></td>
								<td><span class="text-muted" title="{{ $activity->note }}">{{ $activity->definition }}</span></td>
								<td><span class="text-muted">{{ $activity->created_at }}</span></td>
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
