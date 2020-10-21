<!-- Supplier Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('supplier_id', 'Supplier Id:') !!}
    <select class="form-control" name="supplier_id" required>
        <option value="">من فضلك اختر العميل</option>
        @foreach($suppilers as $suppiler)
            <option value="{{$suppiler->id}}"
            @if(isset($supplierPrice) && $supplierPrice->supplier_id == $suppiler->id) selected @endif">{{$suppiler->name}}</option>
        @endforeach
    </select>

</div>

<!-- Product Id Field -->
<div class="form-group col-sm-6">
    {!! Form::label('product_id', 'Product Id:') !!}
    <select  class="form-control js-example-basic-single"class="form-control" name="product_id" required>
        <option value="">من فضلك اختر المنتج</option>
        @foreach($productTypes as $productType)
            <option value="{{$productType->id}}"
                    @if(isset($supplierPrice) && $supplierPrice->product_id == $productType->id) selected @endif
            >{{$productType->name}}</option>
        @endforeach
    </select>
</div>

<!-- Price Field -->
<div class="form-group col-sm-6">
    {!! Form::label('price', 'Price:') !!}
    {!! Form::text('price', null, ['class' => 'form-control']) !!}
</div>

<!-- Submit Field -->
<div class="form-group col-sm-12">
    {!! Form::submit('Save', ['class' => 'btn btn-primary']) !!}
    <a href="{{ route('supplierPrices.index') }}" class="btn btn-default">Cancel</a>
</div>
