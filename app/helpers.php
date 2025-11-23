<?php

if (! function_exists('formatRupiah')) {
    function formatRupiah($value)
    {
        if ($value === null || $value === '') return '-';
        return 'Rp '.number_format($value, 0, ',', '.');
    }
}

if (! function_exists('image_url')) {
    /**
     * Return a usable URL for an image path.
     * - Accepts full URLs and returns them unchanged.
     * - Accepts storage paths (relative to `storage/app/public`) and returns `/storage/...` URL.
     * - Accepts public paths and returns `asset(...)` for them.
     * - If file not found, returns the provided $default or a generic placeholder asset if provided.
     *
     * @param string|null $path
     * @param string|null $default
     * @return string|null
     */
    function image_url($path = null, $default = null)
    {
        if (!$path) {
            return $default ? asset($default) : null;
        }

        // If already a full URL, return as-is
        if (filter_var($path, FILTER_VALIDATE_URL)) {
            return $path;
        }

        // Normalize leading slashes
        $normalized = ltrim($path, '/');

        // If file exists in storage/app/public, return storage URL
        if (file_exists(storage_path('app/public/'.$normalized))) {
            return asset('storage/'.$normalized);
        }

        // If file exists in public path, return asset for it
        if (file_exists(public_path($normalized))) {
            return asset($normalized);
        }

        // Fallback to asset() using given path (useful when path is already under public)
        return $default ? asset($default) : asset($normalized);
    }
}






