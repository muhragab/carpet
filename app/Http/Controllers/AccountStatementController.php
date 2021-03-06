<?php

namespace App\Http\Controllers;

use App\Account;
use App\AccountStatement;
use App\Http\Requests\AccountStatementRequest;
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
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(AccountStatementRequest $request)
    {
        $data = $request->all();
        AccountStatement::create($data);
        return back()->with('success', 'تم اضافة البيان');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\AccountStatement $accountStatement
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request)
    {
        $account = Account::where('id', $request->account)->first();
        return view('mudir.accounts.show_debtor')
            ->withAccount($account)
            ->with('type',$request->type);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\AccountStatement $accountStatement
     * @return \Illuminate\Http\Response
     */
    public function edit(AccountStatement $accountStatement)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  \App\AccountStatement $accountStatement
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, AccountStatement $accountStatement)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\AccountStatement $accountStatement
     * @return \Illuminate\Http\Response
     */
    public function destroy(AccountStatement $accountStatement)
    {
        //
    }
}
