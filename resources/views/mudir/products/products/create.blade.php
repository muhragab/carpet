@extends('mudir.layout')

@section('content')
    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">اضافة صنف جديد</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
    {{ alert($errors) }}
    <!-- /.row -->
        <div class="row">
            <div class="col-lg-12">
                <form action="{{ route('products.store') }}" method="POST" enctype="multipart/form-data">
                    @CSRF

                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>مجموعة البيع</label>
                                <select class="form-control" name="category_id">
                                    <option value=>اختيار اساسي</option>
                                    @foreach($categories as $category)
                                        <option value="{{ $category->id }}">{{ $category->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>بلد المنشأ</label>
                                <select class="form-control" name="country_origin_id">
                                    <option value=>اختيار بلد المنشأ</option>
                                    @foreach($countries as $country)
                                        <option value="{{ $country->id }}">{{ $country->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <label>اسم الصنف</label>
                                <input class="form-control" name="name">
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>الصورة</label>
                                <input type='file' class="form-control" name="image_path"/>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>المقاس</label>
                                <div class="row">
                                    <div class="col-md-6">
                                        <input type='text' class="form-control" name="sizes_width" id="sizes_width"
                                               placeholder="العرض"/>
                                    </div>
                                    <div class="col-md-6">
                                        <input type='text' class="form-control" name="sizes_length" id="sizes_length"
                                               placeholder="الطول"/>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <label>النوع</label>
                                <select class="form-control" name="type_id">
                                    <option value=></option>
                                    @foreach($types as $type)
                                        <option value="{{ $type->id }}">{{ $type->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <label>اللوان</label>
                                <select class="form-control" name="color_id">
                                    <option value=></option>
                                    @foreach($colors as $color)
                                        <option value="{{ $color->id }}">{{ $color->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-3">
                            <div class="form-group">
                                <label>الراسمة</label>
                                <select class="form-control" name="plotter_id">
                                    <option value=></option>
                                    @foreach($plotters as $plotter)
                                        <option value="{{ $plotter->id }}">{{ $plotter->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <label>حد الطلب</label>
                                <div class="row">
                                    <div class="col-md-6">
                                        <input type='text' class="form-control" name="average_demand_limit"
                                               placeholder="الحد الاول (متسوط الخطورة)"/>
                                    </div>
                                    <div class="col-md-6">
                                        <input type='text' class="form-control" name="maximum_demand_limit"
                                               placeholder="الحد الثاني (الاقصي خطورة)"/>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="form-group">
                                <label>سعر المتر</label>
                                <input class="form-control" type="string" name="price_meter">
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
@endsection

@section('content_')
    <div class="kt-container  kt-container--fluid  kt-grid__item kt-grid__item--fluid mt-5">

        <!--begin::Portlet-->
        <div class="kt-portlet">
            <div class="kt-portlet__head">
                <div class="kt-portlet__head-label">
                    <h3 class="kt-portlet__head-title">اضافة مخزن</h3>
                </div>
            </div>

            @if ($errors->any())
                <div class="alert alert-danger" role="alert">
                    <ul style="margin: 0;">
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif

            @if ($message = Session::get('success'))
                <div class="alert alert-success" role="alert">
                    <div class="alert-icon"><i class="flaticon2-checkmark"></i></div>
                    <div class="alert-text">{{ $message }}</div>
                </div>
            @endif

            @if ($message = Session::get('warning'))
                <div class="alert alert-warning" role="alert">
                    <div class="alert-icon"><i class="flaticon-warning"></i></div>
                    <div class="alert-text">{{ $message }}</div>
                </div>
            @endif

            @if ($message = Session::get('error'))
                <div class="alert alert-danger" role="alert">
                    <div class="alert-icon"><i class="flaticon-questions-circular-button"></i></div>
                    <div class="alert-text">{{ $message }}</div>
                </div>
        @endif

        <!--begin::Form-->
            <form action="{{ route('products.store') }}" method="POST" enctype="multipart/form-data"
                  class="kt-form kt-form--label-right" id="kt_form_1">
                @csrf
                <div class="kt-portlet__body">

                    <div class="form-group row">
                        <label class="col-form-label col-lg-3 col-sm-12">التصنيف الرئيسي</label>
                        <div class="col-lg-4 col-md-9 col-sm-12">
                            <select class="form-control kt-select2" id="category-main" name="category_id">
                                <option value=></option>
                                @foreach($categories as $category)
                                    <option value="{{ $category->id }}">{{ $category->name }}</option>
                                @endforeach
                            </select>
                            <span class="form-text text-muted">اختيار التصنيف</span>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-form-label col-lg-3 col-sm-12">بلد المنشأ</label>
                        <div class="col-lg-4 col-md-9 col-sm-12">
                            <select class="form-control kt-select2" id="category-subs" name="sub_category_id">
                                <option value=>اختيار تصنيف فرعي</option>
                            </select>
                            <span class="form-text text-muted">اختيار التصنيف</span>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-form-label col-lg-3 col-sm-12">اسم الصنف</label>
                        <div class="col-lg-4 col-md-9 col-sm-12">
                            <div class='input-group'>
                                <input type='text' class="form-control" name="name"/>
                            </div>
                            <span class="form-text text-muted">ادخل نص هنا</span>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-form-label col-lg-3 col-sm-12">الصورة</label>
                        <div class="col-lg-4 col-md-9 col-sm-12">
                            <div class='input-group'>
                                <input type='file' class="form-control" name="image_path"/>
                            </div>
                            <span class="form-text text-muted">يمكنك رفع صورة</span>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-form-label col-lg-3 col-sm-12">المقاسات</label>
                        <div class="col-lg-4 col-md-9 col-sm-12">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type='text' class="form-control" name="sizes_length" id="sizes_length"
                                           placeholder="الطول"/>
                                </div>
                                <div class="col-md-6">
                                    <input type='text' class="form-control" name="sizes_width" id="sizes_width"
                                           placeholder="العرض"/>
                                </div>
                            </div>
                            <span class="form-text text-muted">اجمالي عدد الامتار المربعة <b
                                    id="sizes_total"></b></span>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-form-label col-lg-3 col-sm-12">النوع</label>
                        <div class="col-lg-4 col-md-9 col-sm-12">
                            <select class="form-control kt-select2" id="kt_select2" name="type_id">
                                <option value=></option>
                                @foreach($types as $type)
                                    <option value="{{ $type->id }}">{{ $type->name }}</option>
                                @endforeach
                            </select>
                            <span class="form-text text-muted">اختيار النوع</span>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-form-label col-lg-3 col-sm-12">اللوان</label>
                        <div class="col-lg-4 col-md-9 col-sm-12">
                            <select class="form-control kt-select2" id="kt_select2" name="color_id">
                                <option value=></option>
                                @foreach($colors as $color)
                                    <option value="{{ $color->id }}">{{ $color->name }}</option>
                                @endforeach
                            </select>
                            <span class="form-text text-muted">اختيار النوع</span>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-form-label col-lg-3 col-sm-12">الراسمة</label>
                        <div class="col-lg-4 col-md-9 col-sm-12">
                            <select class="form-control kt-select2" id="kt_select2" name="plotter_id">
                                <option value=></option>
                                @foreach($plotters as $plotter)
                                    <option value="{{ $plotter->id }}">{{ $plotter->name }}</option>
                                @endforeach
                            </select>
                            <span class="form-text text-muted">اختيار الراسمة</span>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-form-label col-lg-3 col-sm-12">حد الطلب</label>
                        <div class="col-lg-4 col-md-9 col-sm-12">
                            <div class="row">
                                <div class="col-md-6">
                                    <input type='text' class="form-control" name="average_demand_limit"
                                           placeholder="الحد الاول (متسوط الخطورة)"/>
                                </div>
                                <div class="col-md-6">
                                    <input type='text' class="form-control" name="maximum_demand_limit"
                                           placeholder="الحد الثاني (الاقصي خطورة)"/>
                                </div>
                            </div>
                            <span class="form-text text-muted">ادخل ارقما هنا</span>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-form-label col-lg-3 col-sm-12">سعر المتر</label>
                        <div class="col-lg-4 col-md-9 col-sm-12">
                            <div class='input-group'>
                                <input type='number' class="form-control" name="price_meter" id='kt_datepicker'/>
                            </div>
                            <span class="form-text text-muted">ادخل ارقما هنا</span>
                        </div>
                    </div>

                </div>
                <div class="kt-portlet__foot">
                    <div class=" ">
                        <div class="row">
                            <div class="col-lg-9 ml-lg-auto">
                                <button type="submit" class="btn btn-success">تسجيل</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <!--end::Form-->
        </div>

        <!--end::Portlet-->
    </div>
@endsection
