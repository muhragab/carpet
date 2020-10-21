<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name') }}</title>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.8/js/select2.min.js" defer></script>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.{{ url('/') }}/src_admin/js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script>
        function printDiv() {
            var divContents = document.getElementById("bill").innerHTML;
            var a = window.open('', '', 'height=500, width=500');
            a.document.write('<html>');
            a.document.write('<body > <h1><br/><br/></h1> <br>');
            a.document.write(divContents);
            a.document.write('</body></html>');
            a.document.close();
            a.print();
        }
    </script>
    <style>
        .dt-buttons{
            float: left !important;
        }
        .dt-example1_filter{
            float: right !important;
        }
    </style>
    <!-- DataTables -->
    <link rel="stylesheet" href="{{url(asset('css/plugins/datatables-bs4/css/dataTables.bootstrap4.css'))}}">
    <link rel="stylesheet" href="{{url(asset('css/plugins/datatables-buttons/css/buttons.bootstrap4.css'))}}">
    {{--<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.6.4/css/buttons.dataTables.min.css">--}}
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
</div>
<!-- /#wrapper -->

<!-- jQuery Version 1.11.0 -->
<script src="{{ asset('/vendor/mudir/js/jquery-1.11.0.js') }}"></script>

<!-- DataTables -->
<script src="{{ asset('css/plugins/datatables/jquery.dataTables.js') }}"></script>
<script src="{{ asset('css/plugins/datatables-bs4/js/dataTables.bootstrap4.js') }}"></script>
<script src="{{ asset('css/plugins/datatables-buttons/js/dataTables.buttons.js') }}"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
<script src="{{asset('css/plugins/datatables-buttons/js/buttons.html5.min.js')}}"></script>
<script src="{{asset('css/plugins/datatables-buttons/js/buttons.print.min.js')}}"></script>


{{--


--}}
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
        $("#example1").DataTable({
            dom: 'Bfrtip',
            buttons: [
                'pageLength','excel', 'print'
            ]
        });
    });
    $(function () {
        $("#example2").DataTable({
            dom: 'lBfrtip',
            buttons: [
                'pageLength','excel', 'print'
            ]
        });
    });
    $(function () {
        $("#example3").DataTable({
            dom: 'lBfrtip',
            buttons: [
                'pageLength','excel', 'print'
            ]
        });
    });
</script>


<script>
    $(document).ready(function () {
        $('.js-example-basic-single').select2();
    });
</script>
@yield('scripts')

</body>

</html>
