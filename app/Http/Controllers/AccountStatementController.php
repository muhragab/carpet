<?php

namespace App\Http\Controllers;

use App\AccountStatement;
use Illuminate\Http\Request;

class AccountStatementController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request->only([
            'account_id',
            'statement',
            'statement_type',
            'amount',
        ]);
        AccountStatement::create($data);
        return back()->with('success', 'تم اضافة البيان');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\AccountStatement  $accountStatement
     * @return \Illuminate\Http\Response
     */
    public function show(AccountStatement $accountStatement)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\AccountStatement  $accountStatement
     * @return \Illuminate\Http\Response
     */
    public function edit(AccountStatement $accountStatement)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\AccountStatement  $accountStatement
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, AccountStatement $accountStatement)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\AccountStatement  $accountStatement
     * @return \Illuminate\Http\Response
     */
    public function destroy(AccountStatement $accountStatement)
    {
        //
    }
}
