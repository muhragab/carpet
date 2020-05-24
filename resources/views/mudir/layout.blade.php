<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name') }} - Mudir</title>

@if (config('mudir.direction') == 'rtl')
    <!-- Bootstrap Core CSS -->
        <link href="{{ asset('/vendor/mudir/css/rtl/bootstrap.min.css') }}" rel="stylesheet">

        <!-- not use this in ltr -->
        <link href="{{ asset('/vendor/mudir/css/rtl/bootstrap.rtl.css') }}" rel="stylesheet">
@else
    <!-- Bootstrap Core CSS -->
        <link href="{{ asset('/vendor/mudir/css/ltr/bootstrap.min.css') }}" rel="stylesheet">
@endif
<!-- MetisMenu CSS -->
    <link href="{{ asset('/vendor/mudir/css/plugins/metisMenu/metisMenu.min.css') }}" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="{{ asset('/vendor/mudir/css/plugins/timeline.css') }}" rel="stylesheet">

@if (config('mudir.direction') == 'rtl')
    <!-- Custom CSS -->
        <link href="{{ asset('/vendor/mudir/css/rtl/sb-admin-2.css') }}" rel="stylesheet">
@else
    <!-- Custom CSS -->
        <link href="{{ asset('/vendor/mudir/css/ltr/sb-admin-2.css') }}" rel="stylesheet">
@endif
<!-- Morris Charts CSS -->
    <link href="{{ asset('/vendor/mudir/css/plugins/morris.css') }}" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="{{ asset('/vendor/mudir/css/font-awesome/font-awesome.min.css') }}" rel="stylesheet" type="text/css">

    <link href="{{ asset('/vendor/mudir/css/styles.css') }}" rel="stylesheet" type="text/css">

    @if (!empty(config('mudir.themes')))
        <link href="{{ asset('/vendor/mudir/css/themes/'.config('mudir.themes').'.css') }}" rel="stylesheet"
              type="text/css">
@endif
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.{{ url('/') }}/src_admin/js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- DataTables -->
    <link rel="stylesheet" href="{{url(asset('css/plugins/datatables-bs4/css/dataTables.bootstrap4.css'))}}">
</head>

<body>

<div id="wrapper">

    <!-- Navigation -->
    <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="{{ route('mudir.home') }}">{{ config('app.name') }}</a>
        </div>
        <!-- /.navbar-header -->

    @include('mudir.includes.navbar_top_links')
    <!-- /.navbar-top-links -->

        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                @include('mudir.includes.sidemenu')
            </div>
            <!-- /.sidebar-collapse -->
        </div>
        <!-- /.navbar-static-side -->
    </nav>
@yield('content')
<!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<!-- jQuery Version 1.11.0 -->
<script src="{{ asset('/vendor/mudir/js/jquery-1.11.0.js') }}"></script>

<!-- DataTables -->
<script src="{{ asset('css/plugins/datatables/jquery.dataTables.js') }}"></script>
<script src="{{ asset('css/plugins/datatables-bs4/js/dataTables.bootstrap4.js') }}"></script>

<!-- Bootstrap Core JavaScript -->
<script src="{{ asset('/vendor/mudir/js/bootstrap.min.js') }}"></script>

<!-- Metis Menu Plugin JavaScript -->
<script src="{{ asset('/vendor/mudir/js/metisMenu/metisMenu.min.js') }}"></script>

<!-- Morris Charts JavaScript -->
<script src="{{ asset('/vendor/mudir/js/raphael/raphael.min.js') }}"></script>
<script src="{{ asset('/vendor/mudir/js/morris/morris.min.js') }}"></script>

<!-- Custom Theme JavaScript -->
<script src="{{ asset('/vendor/mudir/js/sb-admin-2.js') }}"></script>
<script>
    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });
</script>
<script>
    $(function () {
        $("#example1").DataTable();
    });
</script>
@yield('scripts')

</body>

</html>
