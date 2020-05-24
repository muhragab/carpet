<ul class="nav" id="side-menu">
    <li class="sidebar-search">
        <div class="input-group custom-search-form">
            <input type="text" class="form-control" placeholder="Search...">
            <span class="input-group-btn">
            <button class="btn btn-default" type="button">
                <i class="fa fa-search"></i>
            </button>
        </span>
        </div>
        <!-- /input-group -->
    </li>
    <li>
        <a class="" href="{{ route('mudir.home') }}"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
    </li>

    <li>
        <a class="" href="{{ route('stores.index') }}"><i class="fa fa-dashboard fa-fw"></i> المخازن</a>
    </li>

    <li>
        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> ملف الخزينه<span class="fa arrow"></span></a>
        <ul class="nav nav-second-level">
            <li>
                <a class="" href="{{ route('accountCategories.index') }}"><i class="fa fa-dashboard fa-fw"></i> تصنيف رئيسي</a>
                <a class="" href="{{ route('subAccountCategories.index') }}"><i class="fa fa-dashboard fa-fw"></i> تصنيف فرعي</a>
                <a class="" href="{{ route('accounts.index') }}"><i class="fa fa-dashboard fa-fw"></i> الخزن</a>
            </li>
        </ul>
        <!-- /.nav-second-level -->
    </li>

    <li>
        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> ملف الاصناف<span class="fa arrow"></span></a>
        <ul class="nav nav-second-level">
            <li>
                <a href="{{ route('categories.index') }}">مجموعة البيع</a>
                <a href="{{ route('types.index') }}">الانواع</a>
                <a href="{{ route('colors.index') }}">الالوان</a>
                <a href="{{ route('plotters.index') }}">الرسومات</a>
                <a href="{{ route('country.index') }}">بلد المنشأ</a>
                <a href="{{ route('products.index') }}">الاصناف</a>
            </li>
        </ul>
        <!-- /.nav-second-level -->
    </li>
    <li>
        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> المشتريات<span class="fa arrow"></span></a>
        <ul class="nav nav-second-level">
            <li>
                <a href="{{ route('supplier.index', ['is_supplier' => 1]) }}">الموردين</a>
            </li>
            <li>
                <a href="{{ route('purchase.index') }}">المشتريات</a>
            </li>
            <li>
                <a href="{{ route('back.index') }}">المرتجعات</a>
            </li>
        </ul>
        <!-- /.nav-second-level -->
    </li>
    <li>
        <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> المبيعات<span class="fa arrow"></span></a>
        <ul class="nav nav-second-level">
            <li>
                <a href="{{ route('supplier.index', ['is_client' => 1]) }}">العملاء</a>
            </li>
            <li>
                <a href="{{ route('sales.index') }}">المبيعات</a>
            </li>
            <li>
                <a class="" href="{{ route('salesMen.index') }}">مندوب المبيعات </a>
            </li>
        </ul>
        <!-- /.nav-second-level -->
    </li>
    <li>
        <a class="" href="{{ route('user.index') }}"><i class="fa fa-users fa-fw"></i> المستخدمين</a>
    </li>
    <li>
        <a class="" href="{{ route('activitys.index') }}"><i class="fa fa-users fa-fw"></i> النشاط</a>
    </li>
</ul>
