$(".navbar-search").removeClass("d-none");
$(".termAcceptDocsUrl").attr('data-bind', "text: docName, attr: {'href': itemLink }");
var baseURL = document.location.origin + "/" + window.location.pathname.split('/')[1] + "/bookingfrontend/";
var urlParams = [];
CreateUrlParams(window.location.search);

ko.validation.locale('nb-NO');


function applicationModel() {
    var self = this;
    self.applicationCartItems = ko.computed(function() {
         return bc.applicationCartItems();
    });
    self.deleteItem = (function(e) {
        bc.deleteItem(e);
    });        
    self.typeApplicationRadio = ko.observable();
    self.typeApplicationSelected = ko.computed(function() {
        if(self.typeApplicationRadio() != "undefined" && self.typeApplicationRadio() != null) {
            return true;
        }
        return false;        
    });
        
    self.typeApplicationValidationMessage = ko.observable(false);

    self.applicationSuccess = ko.observable(false);
}

var am = new applicationModel();

ko.applyBindings(am, document.getElementById("new-application-partialtwo"));

$(document).ready(function ()
{
    am.typeApplicationRadio($("#customer_identifier_type_hidden_field").val());
    bc.visible(false);
});