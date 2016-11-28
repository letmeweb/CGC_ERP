/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

requirejs.config({
    //To get timely, correct error triggers in IE, force a define/shim exports check.
    enforceDefine: true,
    paths: {
        jquery: [
            'http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min',
            //If the CDN location fails, load from this location
            'lib/jquery'
        ]
    }
});


