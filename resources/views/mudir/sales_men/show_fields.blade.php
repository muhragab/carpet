<!-- Name Field -->
<div class="form-group">
    {!! Form::label('name', 'Name:') !!}
    <p>{{ $salesMan->name }}</p>
</div>

<!-- Address Field -->
<div class="form-group">
    {!! Form::label('address', 'Address:') !!}
    <p>{{ $salesMan->address }}</p>
</div>

<!-- Phonenumber Field -->
<div class="form-group">
    {!! Form::label('phoneNumber', 'Phonenumber:') !!}
    <p>{{ $salesMan->phoneNumber }}</p>
</div>

<!-- Phone Field -->
<div class="form-group">
    {!! Form::label('phone', 'Phone:') !!}
    <p>{{ $salesMan->phone }}</p>
</div>

<!-- Faxnum Field -->
<div class="form-group">
    {!! Form::label('faxNum', 'Faxnum:') !!}
    <p>{{ $salesMan->faxNum }}</p>
</div>

<!-- Email Field -->
<div class="form-group">
    {!! Form::label('email', 'Email:') !!}
    <p>{{ $salesMan->email }}</p>
</div>

<!-- Created At Field -->
<div class="form-group">
    {!! Form::label('created_at', 'Created At:') !!}
    <p>{{ $salesMan->created_at }}</p>
</div>

<!-- Updated At Field -->
<div class="form-group">
    {!! Form::label('updated_at', 'Updated At:') !!}
    <p>{{ $salesMan->updated_at }}</p>
</div>

