<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Banner;
use Illuminate\Support\Str;

class BannerController extends Controller
{
    /**
     * Menampilkan daftar resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $banners = Banner::orderBy('created_at','asc')->paginate(10);
        return view('backend.banner.index', compact('banners'));
    }

    /**
     * Menampilkan form untuk membuat resource baru.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.banner.create');
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
            'title' => 'required|string|max:50',
            'description' => 'nullable|string',
            'photo' => 'required|string',
            'status' => 'required|in:active,inactive',
        ]);

        $slug = $this->generateUniqueSlug($request->title);
        $validatedData['slug'] = $slug;

        $banner = Banner::create($validatedData);

        $message = $banner
            ? 'Banner berhasil ditambahkan'
            : 'Terjadi kesalahan saat menambahkan banner';

        return redirect()->route('banner.index')->with(
            $banner ? 'success' : 'error',
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
        // Implementasi jika diperlukan
    }

    /**
     * Menampilkan form untuk mengedit resource tertentu.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $banner = Banner::findOrFail($id);
        return view('backend.banner.edit', compact('banner'));
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
        $banner = Banner::findOrFail($id);

        $validatedData = $request->validate([
            'title' => 'required|string|max:50',
            'description' => 'nullable|string',
            'photo' => 'required|string',
            'status' => 'required|in:active,inactive',
        ]);

        $status = $banner->update($validatedData);

        $message = $status
            ? 'Banner berhasil diperbarui'
            : 'Terjadi kesalahan saat memperbarui banner';

        return redirect()->route('banner.index')->with(
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
        $banner = Banner::findOrFail($id);
        $status = $banner->delete();

        $message = $status
            ? 'Banner berhasil dihapus'
            : 'Terjadi kesalahan saat menghapus banner';

        return redirect()->route('banner.index')->with(
            $status ? 'success' : 'error',
            $message
        );
    }

    /**
     * Membuat slug unik untuk banner.
     *
     * @param  string  $title
     * @return string
     */
    private function generateUniqueSlug($title)
    {
        $slug = Str::slug($title);
        $count = Banner::where('slug', $slug)->count();

        if ($count > 0) {
            $slug = $slug . '-' . date('ymdis') . '-' . rand(0, 999);
        }

        return $slug;
    }
}