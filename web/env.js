window.env = {
    // firebase
    FIREBASE_API_KEY: "AIzaSyCsocFANvhTeNgD6ds-HrFgfxQjhkLaaIY",
    FIREBASE_AUTH_DOMAIN: "realmen-2023.firebaseapp.com",
    FIREBASE_DB_URL: "https://realmen-2023-default-rtdb.asia-southeast1.firebasedatabase.app",
    FIREBASE_PROJECT_ID: "realmen-2023",
    FIREBASE_STORAGE_BUCKET: "realmen-2023.appspot.com",
    FIREBASE_MESSAGING_SENDER_ID: "557539940447",
    FIREBASE_APP_ID: "1:557539940447:web:cea505d424c820a41ea3ea",
    FIREBASE_MEASUREMENT_ID: "G-CZZR22EX5J",

    // image from assets
    LOGO: "logo_chua_xoa_nen_2.png",
    LOGO_NO_BRAND: "paw_logo_xoa_nen.png",

    // api
    PAW_DOMAIN: "https://pawfund-core-service-2e6d01c7cb49.herokuapp.com",

    PAW_DOMAIN_LOCAL: "http://localhost:8080",

    IS_LOCAL: true,
};

window.env.DOMAIN = window.env.IS_LOCAL ? window.env.PAW_DOMAIN_LOCAL : window.env.PAW_DOMAIN;

window.env.PAW_REGISTRATION = `${window.env.DOMAIN}/v1/pub/account/shelter-owner`;

window.env.PAW_ACCOUNT_PUB = `${window.env.DOMAIN}/v1/pub/account`;

window.env.PAW_ACCOUNT = `${window.env.DOMAIN}/v1/api/account`;

window.env.PAW_VERIFICATION_ACCOUNT = `${window.env.DOMAIN}/v1/pub/verification/account`

window.env.PAW_LOGIN = `${window.env.DOMAIN}/v1/pub/auth`;

