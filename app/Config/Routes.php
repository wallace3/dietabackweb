<?php

use CodeIgniter\Router\RouteCollection;

/**
 * @var RouteCollection $routes
 */

/* USERS */

$routes->post('users', 'UsersController::create');
$routes->get('users', 'UsersController::index');
$routes->get('users/(:num)', 'UsersController::show/$1');
$routes->put('users/(:num)', 'UsersController::update/$1');
$routes->post('users/password/(:num)', 'UsersController::changePassword/$1');
$routes->post('users/deactivate/(:num)', 'UsersController::deactivateUser/$1');

/* ADDRESSS */
$routes->get('addresses/(:num)', 'AddressController::index/$1');
$routes->get('address/(:num)', 'AddressController::show/$1');
$routes->get('address/default/(:num)', 'AddressController::defaultAddress/$1');
$routes->post('address', 'AddressController::create');
$routes->post('address/update/(:num)', 'AddressController::update/$1');
$routes->delete('address/(:num)', 'AddressController::delete/$1');
$routes->put('address/deactivate/(:num)', 'AddressController::deactivateAddress/$1');

/* USER_TYPES */
$routes->get('types', 'TypesController::index');
$routes->post('types', 'TypesController::create');

/* CATEGORIES */
$routes->get('categories', 'CategoriesController::index');
$routes->post('categories', 'CategoriesController::create');
$routes->post('categories/update/(:num)', 'CategoriesController::update/$1');
$routes->put('categories/deactivate/(:num)', 'CategoriesController::deactivateCategory/$1');
$routes->delete('categories/(:num)', 'CategoriesController::delete/$1');
$routes->get('categories/active', 'CategoriesController::getCategories');

/* PRODUCTS */
$routes->get('products', 'ProductsController::index');
$routes->get('product/(:num)', 'ProductsController::show/$1');
$routes->post('products', 'ProductsController::create');
$routes->put('products/(:num)', 'ProductsController::update/$1');
$routes->put('products/deactivate/(:num)', 'ProductsController::deactivateProduct/$1');
$routes->get('products/categories','ProductsController::getProductsImage');

/* IMAGES */
$routes->get('images/(:num)', 'ImagesController::index/$1');
$routes->post('images', 'ImagesController::create');
$routes->post('images/upload/(:num)', 'ImagesController::upload/$1');
$routes->delete('images/(:num)', 'ImagesController::delete/$1');

/* AUCTION */
$routes->get('auction', 'AuctionController::index');
$routes->get('auction/active', 'AuctionController::getActives');
$routes->post('auction', 'AuctionController::create');
$routes->put('auction/(:num)', 'AuctionController::endAuction/$1');
$routes->delete('auction/(:num)', 'AuctionController::delete/$1');

/* BIDS */
$routes->get('bids', 'BidsController::index');
$routes->get('bids/product/(:num)', 'BidsController::productBids/$1');
$routes->post('bids', 'BidsController::create');

/* SUBCATEGORIES */
$routes->get('subcategories', 'SubcategoriesController::index');
$routes->post('subcategories', 'SubcategoriesController::create');
$routes->put('subcategories/(:num)', 'SubcategoriesController::update/$1');
$routes->put('subcategories/deactivate/(:num)', 'SubcategoriesController::deactivateSubCategory/$1');
$routes->delete('subcategories/(:num)', 'SubcategoriesController::delete/$1');

/* BANNERS */
$routes->get('banners', 'BannersController::index');
$routes->post('banners', 'BannersController::create');
$routes->post('banners/upload', 'BannersController::upload');
$routes->delete('banners/(:num)', 'BannersController::delete/$1');

/* CART */
$routes->get('cart', 'CartController::index');
$routes->post('cart', 'CartController::create');
$routes->get('cart/get/(:num)', 'CartController::getCart/$1');
$routes->delete('cart/(:num)', 'CartController::delete/$1');

/* WISHLIST */
$routes->get('wishlist', 'WishListController::index');
$routes->post('wishlist', 'WishListController::create');
$routes->get('wishlist/get/(:num)', 'WishListController::getWishList/$1');
$routes->delete('wishlist/(:num)', 'WishListController::delete/$1');