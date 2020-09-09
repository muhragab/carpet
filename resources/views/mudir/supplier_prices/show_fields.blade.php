<!-- Supplier Id Field -->
<div class="form-group">
    {!! Form::label('supplier_id', 'Supplier Id:') !!}
    <p>{{ $supplierPrice->supplier_id }}</p>
</div>

<!-- Product Id Field -->
<div class="form-group">
    {!! Form::label('product_id', 'Product Id:') !!}
    <p>{{ $supplierPrice->product_id }}</p>
</div>

<!-- Price Field -->
<div class="form-group">
    {!! Form::label('price', 'Price:') !!}
    <p>{{ $supplierPrice->price }}</p>
</div>

<!-- Created At Field -->
<div class="form-group">
    {!! Form::label('created_at', 'Created At:') !!}
    <p>{{ $supplierPrice->created_at }}</p>
</div>

<!-- Updated At Field -->
<div class="form-group">
    {!! Form::label('updated_at', 'Updated At:') !!}
    <p>{{ $supplierPrice->updated_at }}</p>
</div>

