window.env = {
    // firebase
    FIREBASE_API_KEY: "AIzaSyCqBFSwOEItmuCH8IYrBWidzANjIDV4nrw",
    FIREBASE_AUTH_DOMAIN: "paw-fund-shelter-o.firebaseapp.com",
//    FIREBASE_DB_URL: "https://realmen-2023-default-rtdb.asia-southeast1.firebasedatabase.app",
    FIREBASE_PROJECT_ID: "paw-fund-shelter-o",
    FIREBASE_STORAGE_BUCKET: "paw-fund-shelter-o.firebasestorage.app",
    FIREBASE_MESSAGING_SENDER_ID: "1030255301551",
    FIREBASE_APP_ID: "1:1030255301551:web:84ac5c26b1d3f13627555a",
    FIREBASE_MEASUREMENT_ID: "G-CZRBHT5ZWN",

    // image from assets
    LOGO: "assets/logo_chua_xoa_nen_2.png",
    LOGO_NO_BRAND: "assets/paw_logo_xoa_nen.png",
    REGISTRATION_IMG: "assets/sua.jpg",
    SENDING_VERIFICATION_IMG: "assets/sua.jpg",
    LOGIN_IMG: "assets/sua.jpg",

    // api
    PAW_DOMAIN: "https://pawfund-core-service-2e6d01c7cb49.herokuapp.com",

    PAW_DOMAIN_LOCAL: "http://localhost:8080",

    IS_LOCAL: false,
};

window.env.DOMAIN = window.env.IS_LOCAL ? window.env.PAW_DOMAIN_LOCAL : window.env.PAW_DOMAIN;

window.env.PAW_REGISTRATION = `${window.env.DOMAIN}/v1/pub/account/shelter-owner`;

window.env.PAW_ACCOUNT_PUB = `${window.env.DOMAIN}/v1/pub/account`;

window.env.PAW_ACCOUNT = `${window.env.DOMAIN}/v1/api/account`;

window.env.PAW_VERIFICATION_ACCOUNT = `${window.env.DOMAIN}/v1/pub/verification/account`

window.env.PAW_LOGIN = `${window.env.DOMAIN}/v1/pub/auth`;

