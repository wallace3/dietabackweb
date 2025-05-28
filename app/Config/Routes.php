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
$routes->post('users/login', 'UsersController::login');

/* ADDRESSS */
$routes->get('addresses/(:num)', 'AddressController::index/$1');
$routes->get('address/(:num)', 'AddressController::show/$1');
$routes->get('address/default/(:num)', 'AddressController::defaultAddress/$1');
$routes->post('address', 'AddressController::create');
$routes->post('address/update/(:num)', 'AddressController::update/$1');
$routes->delete('address/(:num)', 'AddressController::delete/$1');
$routes->put('address/deactivate/(:num)', 'AddressController::deactivateAddress/$1');
$routes->put('address/default/(:num)/(:num)', 'AddressController::setDefault/$1/$2');

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
$routes->get('auction/amount/(:num)', 'AuctionController::getAuctionAmount/$1');
$routes->post('auction', 'AuctionController::create');
$routes->post('auction/create', 'AuctionController::createAuction');
$routes->put('auction/(:num)', 'AuctionController::endAuction/$1');
$routes->delete('auction/(:num)', 'AuctionController::delete/$1');
$routes->post('auction/update/(:num)', 'AuctionController::updateAuction/$1');
$routes->get('auction/endedAuctions', 'AuctionController::getEndedAuctions');
$routes->get('auction/results/(:num)', 'AuctionController::getResultAuctions/$1');
$routes->get('auction/underbidders/(:num)', 'AuctionController::getUnderBidders/$1');

/* AUCTION DETAILS */
$routes->get('auction/details', 'AuctionDetailsController::index');
$routes->post('auction/details', 'AuctionDetailsController::create');
$routes->get('auction/details/products/(:num)', 'AuctionDetailsController::getAuctionProducts/$1');
$routes->delete('auction/details/delete/(:num)', 'AuctionDetailsController::delete/$1');


/* BIDS */
$routes->get('bids', 'BidsController::index');
$routes->get('bids/product/(:num)', 'BidsController::productBids/$1');
$routes->post('bids', 'BidsController::create');
$routes->get('bids/history', 'BidsController::getBids');

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

/* STRIPE */
$routes->post('stripe/createCheckoutSession', 'StripeController::createCheckoutSession');
$routes->get('stripe/sessioninfo/(:segment)', 'StripeController::sessionInfo/$1');
$routes->get('stripe/paidOrders', 'StripeController::paidOrders');
$routes->get('stripe/unpaidOrders', 'StripeController::unpaidOrders');
$routes->get('stripe/history/(:num)', 'StripeController::history/$1');
$routes->get('stripe/orderDetails/(:num)', 'StripeController::orderDetails/$1');
