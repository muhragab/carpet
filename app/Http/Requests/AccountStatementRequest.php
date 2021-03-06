<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AccountStatementRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            "account_id" => 'required|exists:accounts,id',
            "statement_type" => 'required|in:creditor,debtor',
            "category" => 'required|integer',
            "type" => 'required|in:1,2',
            "date" => 'required|date',
            "statement" => 'required',
            "amount" => 'required',
        ];
    }
}
