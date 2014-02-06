import bb.cascades 1.0

Page {
    attachedObjects: [
        ComponentDefinition {
            id: optionControlDefinition
            Option {
            }
        }
    ]
    function getData() {
        var request = new XMLHttpRequest()
        request.onreadystatechange = function() {
            if (request.readyState == 4) {
                var resp = request.responseText
                resp = JSON.parse(resp)
                var resp2 = resp.response.msg.tiposSondeos
                console.log(JSON.stringify(resp2))
                console.log(resp2.lenght)
                //resp2 = JSON.parse(resp2)
               // var addressComponents = resp2.msg[0]
                for (var i = 0; i < resp2.length; i ++) {
                    var option = optionControlDefinition.createObject();
                    option.text = resp2[i].tipoSondeo
                    dropDown.add(option)
                }
            }
        }
        
        // I have used goole's web service url, you can replace with your url
        //request.open("GET", "http://maps.googleapis.com/maps/api/geocode/json?address=" + "Ahmedabad" + "&sensor=false", true)
        request.open("GET", "http://observatoriodeprecios.defensoria.gob.sv/ApiREST.php/v1/getFiltrosBusqueda/4/", true)
        request.send()
    }
    Container {
        DropDown {
            id: dropDown
        }
        Button {
            onClicked: getData()
        }
    }
    onCreationCompleted: {
        getData()
    }
}