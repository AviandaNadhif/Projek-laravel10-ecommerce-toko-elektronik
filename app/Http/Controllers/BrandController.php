<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Brand;
use Illuminate\Support\Str;
use App\Helpers\helpers;

class BrandController extends Controller
{
    /**
     * Menampilkan daftar resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $perPage = request()->input('show', 10);
        $brands = Brand::orderBy('title','ASC')->paginate($perPage);
        return view('backend.brand.index', compact('brands'));
    }

    /**
     * Menampilkan form untuk membuat resource baru.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.brand.create');
    }

    /**
     * Menyimpan resource yang baru dibuat ke penyimpanan.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'title' => 'required|string',
            'status' => 'required|in:active,inactive',
        ]);

        $slug = generateUniqueSlug($request->title, Brand::class);

        $validatedData['slug'] = $slug;

        $brand = Brand::create($validatedData);

        $message = $brand
            ? 'Brand berhasil dibuat'
            : 'Terjadi kesalahan, silakan coba lagi';

        return redirect()->route('brand.index')->with(
            $brand ? 'success' : 'error',
            $message
        );
    }

    /**
     * Menampilkan resource tertentu.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Menampilkan form untuk mengedit resource tertentu.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $brand = Brand::find($id);

        if (!$brand) {
            return redirect()->back()->with('error', 'Brand tidak ditemukan');
        }

        return view('backend.brand.edit', compact('brand'));
    }



    /**
     * Memperbarui resource tertentu di penyimpanan.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $brand = Brand::find($id);

        if (!$brand) {
            return redirect()->back()->with('error', 'Brand tidak ditemukan');
        }

        $validatedData = $request->validate([
            'title' => 'required|string',
            'status' => 'required|in:active,inactive',
        ]);

        $status = $brand->update($validatedData);

        $message = $status
            ? 'Brand berhasil diperbarui'
            : 'Terjadi kesalahan, silakan coba lagi';

        return redirect()->route('brand.index')->with(
            $status ? 'success' : 'error',
            $message
        );
    }

    /**
     * Menghapus resource tertentu dari penyimpanan.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $brand = Brand::find($id);

        if (!$brand) {
            return redirect()->back()->with('error', 'Brand tidak ditemukan');
        }

        $status = $brand->delete();

        $message = $status
            ? 'Brand berhasil dihapus'
            : 'Terjadi kesalahan, silakan coba lagi';

        return redirect()->route('brand.index')->with(
            $status ? 'success' : 'error',
            $message
        );
    }
}