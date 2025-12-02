<?php

    use Illuminate\Support\Facades\Route;
    use Illuminate\Support\Facades\Artisan;
    use App\Http\Controllers\AdminController;
    use App\Http\Controllers\Auth\ForgotPasswordController;
    use App\Http\Controllers\FrontendController;
    use App\Http\Controllers\Auth\LoginController;
    use App\Http\Controllers\CartController;
    use App\Http\Controllers\WishlistController;
    use App\Http\Controllers\OrderController;
    use App\Http\Controllers\ProductReviewController;
    use App\Http\Controllers\CouponController;
    // Note: MessageController, PostCommentController and PayPalController
    // were referenced in routes but controllers were not present in the
    // Controllers directory. Those routes have been removed to avoid
    // runtime errors. If you add those controllers back, re-add the use
    // statements and corresponding routes below.
    use App\Http\Controllers\NotificationController;
    use App\Http\Controllers\HomeController;
    use \UniSharp\LaravelFilemanager\Lfm;
    use App\Http\Controllers\Auth\ResetPasswordController;
    /*
    |--------------------------------------------------------------------------
    | Rute Web
    |--------------------------------------------------------------------------
    |
    | Di sini Anda dapat mendaftarkan rute web untuk aplikasi Anda. Rute-rute
    | ini dimuat oleh RouteServiceProvider dalam grup yang menggunakan
    | middleware "web". Silakan tambahkan rute yang diperlukan untuk fitur aplikasi.
    |
    */

    // RUTE: BERSIHKAN CACHE
    Route::get('cache-clear', function () {
        Artisan::call('optimize:clear');
        request()->session()->flash('success', 'Successfully cache cleared.');
        return redirect()->back();
    })->name('cache.clear');

    // RUTE: TROUBLESHOOT - cek cepat storage, assets dan ekstensi
    Route::get('troubleshoot', function () {
        $results = [];

        $storageLinkPath = public_path('storage');
        $results[] = [
            'name' => 'public/storage',
            'status' => file_exists($storageLinkPath) ? 'OK' : 'MISSING',
            'detail' => file_exists($storageLinkPath) ? realpath($storageLinkPath) : 'Not found',
        ];

        $photosPath = storage_path('app/public/photos');
        $photosStatus = 'NOT FOUND';
        $photosDetail = 'Not found';
        if (is_dir($photosPath)) {
            $files = array_values(array_diff(scandir($photosPath), ['.', '..']));
            if (count($files)) {
                $photosStatus = 'OK';
                $photosDetail = implode(', ', array_slice($files, 0, 12));
            } else {
                $photosStatus = 'EMPTY';
                $photosDetail = 'Directory exists but empty';
            }
        }
        $results[] = [
            'name' => 'storage/app/public/photos',
            'status' => $photosStatus,
            'detail' => $photosDetail,
        ];

        $lfmPath = public_path('vendor/laravel-filemanager');
        $results[] = [
            'name' => 'public/vendor/laravel-filemanager',
            'status' => is_dir($lfmPath) ? 'OK' : 'MISSING',
            'detail' => is_dir($lfmPath) ? 'Exists' : 'Not published',
        ];

        $results[] = [
            'name' => 'image_url() helper',
            'status' => function_exists('image_url') ? 'OK' : 'MISSING',
            'detail' => function_exists('image_url') ? 'Available' : 'Add app/helpers.php and run composer dump-autoload',
        ];

        $results[] = [
            'name' => 'PHP extension: gd',
            'status' => extension_loaded('gd') ? 'OK' : 'MISSING',
            'detail' => extension_loaded('gd') ? phpversion('gd') : 'Not loaded',
        ];
        $results[] = [
            'name' => 'PHP extension: imagick',
            'status' => extension_loaded('imagick') ? 'OK' : 'MISSING',
            'detail' => extension_loaded('imagick') ? phpversion('imagick') : 'Not loaded',
        ];

        $results[] = [
            'name' => 'PHP version',
            'status' => PHP_VERSION,
            'detail' => php_sapi_name(),
        ];

        return view('backend.troubleshoot', compact('results'));
    })->name('troubleshoot');


    // RUTE: TAUTKAN STORAGE
    Route::get('storage-link',[AdminController::class,'storageLink'])->name('storage.link');


    Auth::routes(['register' => false]);

    Route::get('user/login', [FrontendController::class, 'login'])->name('login.form');
    Route::post('user/login', [FrontendController::class, 'loginSubmit'])->name('login.submit');
    Route::get('user/logout', [FrontendController::class, 'logout'])->name('user.logout');

    Route::get('user/register', [FrontendController::class, 'register'])->name('register.form');
    Route::post('user/register', [FrontendController::class, 'registerSubmit'])->name('register.submit');
   
    // Reset password
    Route::get('password/reset', [ResetPasswordController::class, 'showResetForm'])->name('password.reset');
    Route::post('password/reset', [ResetPasswordController::class, 'reset'])->name('password.update');
    // Password Reset Routes
    Route::get('password/reset', [ForgotPasswordController::class, 'showLinkRequestForm'])->name('password.request');
    Route::post('password/email', [ForgotPasswordController::class, 'sendResetLinkEmail'])->name('password.email');
    Route::get('password/reset/{token}', [ResetPasswordController::class, 'showResetForm'])->name('password.reset');
    Route::post('password/reset', [ResetPasswordController::class, 'reset'])->name('password.update');

    // Socialite
    Route::get('login/{provider}/', [LoginController::class, 'redirect'])->name('login.redirect');
    Route::get('login/{provider}/callback/', [LoginController::class, 'Callback'])->name('login.callback');

    Route::get('/', [FrontendController::class, 'home'])->name('home');


    Auth::routes(['register' => false]);

    Route::get('user/login', [FrontendController::class, 'login'])->name('login.form');
    Route::post('user/login', [FrontendController::class, 'loginSubmit'])->name('login.submit');
    Route::get('user/logout', [FrontendController::class, 'logout'])->name('user.logout');

    Route::get('user/register', [FrontendController::class, 'register'])->name('register.form');
    Route::post('user/register', [FrontendController::class, 'registerSubmit'])->name('register.submit');
   
    // Reset password
    Route::get('password/reset', [ResetPasswordController::class, 'showResetForm'])->name('password.reset');
    Route::post('password/reset', [ResetPasswordController::class, 'reset'])->name('password.update');
    // Password Reset Routes
    Route::get('password/reset', [ForgotPasswordController::class, 'showLinkRequestForm'])->name('password.request');
    Route::post('password/email', [ForgotPasswordController::class, 'sendResetLinkEmail'])->name('password.email');
    Route::get('password/reset/{token}', [ResetPasswordController::class, 'showResetForm'])->name('password.reset');
    Route::post('password/reset', [ResetPasswordController::class, 'reset'])->name('password.update');

    // Socialite
    Route::get('login/{provider}/', [LoginController::class, 'redirect'])->name('login.redirect');
    Route::get('login/{provider}/callback/', [LoginController::class, 'Callback'])->name('login.callback');

    Route::get('/', [FrontendController::class, 'home'])->name('home');

// Rute Frontend
    Route::get('/home', [FrontendController::class, 'index']);
    Route::get('/about-us', [FrontendController::class, 'aboutUs'])->name('about-us');
    Route::get('/contact', [FrontendController::class, 'contact'])->name('contact');
    // Route::post('/contact/message', [MessageController::class, 'store'])->name('contact.store');
    Route::get('product-detail/{slug}', [FrontendController::class, 'productDetail'])->name('product-detail');
    Route::post('/product/search', [FrontendController::class, 'productSearch'])->name('product.search');
    Route::get('/product-cat/{slug}', [FrontendController::class, 'productCat'])->name('product-cat');
    Route::get('/product-sub-cat/{slug}/{sub_slug}', [FrontendController::class, 'productSubCat'])->name('product-sub-cat');
    Route::get('/product-brand/{slug}', [FrontendController::class, 'productBrand'])->name('product-brand');
// Bagian Keranjang
    Route::get('/add-to-cart/{slug}', [CartController::class, 'addToCart'])->name('add-to-cart')->middleware('user');
    Route::post('/add-to-cart', [CartController::class, 'singleAddToCart'])->name('single-add-to-cart')->middleware('user');
    Route::get('cart-delete/{id}', [CartController::class, 'cartDelete'])->name('cart-delete');
    Route::post('cart-update', [CartController::class, 'cartUpdate'])->name('cart.update');

    Route::get('/cart', function () {
        return view('frontend.pages.cart');
    })->name('cart');
    Route::get('/checkout', [CartController::class, 'checkout'])->name('checkout')->middleware('user');
// Daftar Keinginan (Wishlist)
    Route::get('/wishlist', function () {
        return view('frontend.pages.wishlist');
    })->name('wishlist');
    Route::get('/wishlist/{slug}', [WishlistController::class, 'wishlist'])->name('add-to-wishlist')->middleware('user');
    Route::get('wishlist-delete/{id}', [WishlistController::class, 'wishlistDelete'])->name('wishlist-delete');
    Route::post('cart/order', [OrderController::class, 'store'])->name('cart.order');
    Route::get('order/pdf/{id}', [OrderController::class, 'pdf'])->name('order.pdf');
    Route::get('/income', [OrderController::class, 'incomeChart'])->name('product.order.income');
    // RUTE: data pesanan per-hari untuk grafik pai (7 hari terakhir)
    Route::get('/order-day', [OrderController::class, 'orderDayChart'])->name('product.order.day');
// Route::get('/user/chart',[AdminController::class, 'userPieChart'])->name('user.piechart');
    Route::get('/product-grids', [FrontendController::class, 'productGrids'])->name('product-grids');
    Route::get('/product-lists', [FrontendController::class, 'productLists'])->name('product-lists');
    Route::match(['get', 'post'], '/filter', [FrontendController::class, 'productFilter'])->name('shop.filter');
// Lacak Pesanan
    Route::get('/product/track', [OrderController::class, 'orderTrack'])->name('order.track');
    Route::post('product/track/order', [OrderController::class, 'productTrackOrder'])->name('product.track.order');
// Blog (dihapus) - halaman dan filter blog tidak digunakan di proyek ini
    // Route::get('/blog', [FrontendController::class, 'blog'])->name('blog');
    // Route::get('/blog-detail/{slug}', [FrontendController::class, 'blogDetail'])->name('blog.detail');
    // Route::get('/blog/search', [FrontendController::class, 'blogSearch'])->name('blog.search');
    // Route::post('/blog/filter', [FrontendController::class, 'blogFilter'])->name('blog.filter');
    // Route::get('blog-cat/{slug}', [FrontendController::class, 'blogByCategory'])->name('blog.category');
    // Route::get('blog-tag/{slug}', [FrontendController::class, 'blogByTag'])->name('blog.tag');

// Newsletter


// Ulasan Produk
    Route::resource('/review', 'ProductReviewController');
    Route::post('product/{slug}/review', [ProductReviewController::class, 'store'])->name('review.store');

// Komentar Post (controller tidak ada) - rute dikomentari hingga controller ditambahkan
    // Route::post('post/{slug}/comment', [PostCommentController::class, 'store'])->name('post-comment.store');
    // Route::resource('/comment', 'PostCommentController');
// Coupon
    Route::post('/coupon-store', [CouponController::class, 'couponStore'])->name('coupon-store');
// Pembayaran (controller PayPal tidak tersedia) - rute dikomentari hingga controller ditambahkan
    // Route::get('payment', [PayPalController::class, 'payment'])->name('payment');
    // Route::get('cancel', [PayPalController::class, 'cancel'])->name('payment.cancel');
    // Route::get('payment/success', [PayPalController::class, 'success'])->name('payment.success');


// Bagian Backend (admin)

    Route::group(['prefix' => '/admin', 'middleware' => ['auth', 'admin']], function () {
        Route::get('/', [AdminController::class, 'index'])->name('admin');
        Route::get('/file-manager', function () {
            return view('backend.layouts.file-manager');
        })->name('file-manager');
        // Rute pengguna (manajemen user)
        Route::resource('users', 'UsersController');
        // Banner
        Route::resource('banner', 'BannerController');
        // Brand
        Route::resource('brand', 'BrandController');
        // Profile
        Route::get('/profile', [AdminController::class, 'profile'])->name('admin-profile');
        Route::post('/profile/{id}', [AdminController::class, 'profileUpdate'])->name('profile-update');
        // Category
        Route::resource('/category', 'CategoryController');
        // Product
        Route::resource('/product', 'ProductController');
        // AJAX untuk sub-kategori
        Route::post('/category/{id}/child', 'CategoryController@getChildByParent');
        // Kategori post (manajemen kategori posting)
        Route::resource('/post-category', 'PostCategoryController');
        // Tag posting
        Route::resource('/post-tag', 'PostTagController');
        // Post (manajemen posting)
        Route::resource('/post', 'PostController');
        // Rute pesan (MessageController tidak tersedia) - dikomentari
        // Route::resource('/message', 'MessageController');
        // Route::get('/message/five', [MessageController::class, 'messageFive'])->name('messages.five');

        // Pesanan
        Route::resource('/order', 'OrderController');
        // Pengiriman
        Route::resource('/shipping', 'ShippingController');
        // Kupon
        Route::resource('/coupon', 'CouponController');
        // Pengaturan
        Route::get('settings', [AdminController::class, 'settings'])->name('settings');
        Route::post('setting/update', [AdminController::class, 'settingsUpdate'])->name('settings.update');

        // Notifikasi
        Route::get('/notification/{id}', [NotificationController::class, 'show'])->name('admin.notification');
        Route::get('/notifications', [NotificationController::class, 'index'])->name('all.notification');
        Route::delete('/notification/{id}', [NotificationController::class, 'delete'])->name('notification.delete');
        // Perubahan Password
        Route::get('change-password', [AdminController::class, 'changePassword'])->name('change.password.form');
        Route::post('change-password', [AdminController::class, 'changPasswordStore'])->name('change.password');
    });


// Bagian Pengguna (user)
    Route::group(['prefix' => '/user', 'middleware' => ['user']], function () {
        Route::get('/', [HomeController::class, 'index'])->name('user');
        // Profil
        Route::get('/profile', [HomeController::class, 'profile'])->name('user-profile');
        Route::post('/profile/{id}', [HomeController::class, 'profileUpdate'])->name('user-profile-update');
        // Pesanan (rantai user)
        Route::get('/order', "HomeController@orderIndex")->name('user.order.index');
        Route::get('/order/show/{id}', "HomeController@orderShow")->name('user.order.show');
        Route::delete('/order/delete/{id}', [HomeController::class, 'userOrderDelete'])->name('user.order.delete');
        // Ulasan Produk oleh pengguna
        Route::get('/user-review', [HomeController::class, 'productReviewIndex'])->name('user.productreview.index');
        Route::delete('/user-review/delete/{id}', [HomeController::class, 'productReviewDelete'])->name('user.productreview.delete');
        Route::get('/user-review/edit/{id}', [HomeController::class, 'productReviewEdit'])->name('user.productreview.edit');
        Route::patch('/user-review/update/{id}', [HomeController::class, 'productReviewUpdate'])->name('user.productreview.update');

        // Komentar post (dihapus) - fungsionalitas post/comment tidak tersedia di build ini
        // Route::get('user-post/comment', [HomeController::class, 'userComment'])->name('user.post-comment.index');
        // Route::delete('user-post/comment/delete/{id}', [HomeController::class, 'userCommentDelete'])->name('user.post-comment.delete');
        // Route::get('user-post/comment/edit/{id}', [HomeController::class, 'userCommentEdit'])->name('user.post-comment.edit');
        // Route::patch('user-post/comment/udpate/{id}', [HomeController::class, 'userCommentUpdate'])->name('user.post-comment.update');

        // Perubahan Password (user)
        Route::get('change-password', [HomeController::class, 'changePassword'])->name('user.change.password.form');
        Route::post('change-password', [HomeController::class, 'changPasswordStore'])->name('change.password');

    });

    Route::group(['prefix' => 'laravel-filemanager', 'middleware' => ['web', 'auth']], function () {
    Lfm::routes();
    });
