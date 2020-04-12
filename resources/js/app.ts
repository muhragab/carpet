// declare function require(name:string);

/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

let Vue = require('vue').default;

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

Vue.component('example-component', require('./components/ExampleComponent.vue').default);
Vue.component('purchase-component', require('./components/PurchaseComponent.vue').default);
Vue.component('back-purchase-component', require('./components/BackPurchaseComponent.vue').default);
Vue.component('sales-component', require('./components/SalesComponent.vue').default);

const app = new Vue({
    el: '#app'
});