/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

function addHeader(divName) {
    var Headerdiv = document.createElement('div');

    Str_Info_Header = "<div class='row'>"
            //+ " <div class='col-md-1'></div>"                
            + "<label class='control-label col-md-1 columnlabel1'></label>"
            + " <div class='col-md-1'><font color = 'blue'><input type='text' class='inputs1' name='inputH1' id='inputH1' size='7' value='วันที่'  disabled/></font></div>"
            + " <div class='col-md-1'><font color = 'blue'><input type='text' class='inputs1' name='inputH2' id='inputH2' size='7' value='เตา'  disabled/></font></div>"
            + " <div class='col-md-1'><font color = 'blue'><input type='text' class='inputs1' name='inputH3' id='inputH3' size='7' value='เวลา (น.)'  disabled/></font></div>"
            + " <div class='col-md-1'><font color = 'green'><input type='text' class='inputs1' name='inputH4' id='inputH4' size='7' value='วันที่'  disabled/></font></div>"
            + " <div class='col-md-1'><font color = 'green'><input type='text' class='inputs1' name='inputH5' id='inputH5' size='7' value='เตา'  disabled/></font></div>"
            + " <div class='col-md-1'><font color = 'green'><input type='text' class='inputs1' name='inputH6' id='inputH6' size='7' value='เวลา (น.)'  disabled/></font></div>"
            + " <div class='col-md-1'><font color = 'red'><input type='text' class='inputs1' name='inputH7' id='inputH7' size='7' value='วันที่'  disabled/></font></div>"
            + " <div class='col-md-1'><font color = 'red'><input type='text' class='inputs1' name='inputH8' id='inputH8' size='7' value='เตา'  disabled/></font></div>"
            + " <div class='col-md-1'><font color = 'red'><input type='text' class='inputs1' name='inputH9' id='inputH9' size='7' value='เวลา (น.)'  disabled/></font></div>"
            + "</div>";

    Str_Info_Detail = "<div class='row'>"
            //+ "<div class='col-md-1'></div>"
            + "<label class='control-label col-md-1 columnlabel1'></label>"
            + " <div class='col-md-1'><input type='text' class='inputs1' name='tdate1' id='tdate1' size='7' value='' /></div>"
            + " <div class='col-md-1'><input type='text' class='inputs1' name='tname1' id='tname1' size='7' value='' /></div>"
            + " <div class='col-md-1'><input type='text' class='inputs1' name='ttime1' id='ttime1' size='7' value='' /></div>"
            + " <div class='col-md-1'><input type='text' class='inputs1' name='tdate2' id='tdate2' size='7' value='' /></div>"
            + " <div class='col-md-1'><input type='text' class='inputs1' name='tname2' id='tname2' size='7' value='' /></div>"
            + " <div class='col-md-1'><input type='text' class='inputs1' name='ttime2' id='ttime2' size='7' value='' /></div>"
            + " <div class='col-md-1'><input type='text' class='inputs1' name='tdate3' id='tdate3' size='7' value='' /></div>"
            + " <div class='col-md-1'><input type='text' class='inputs1' name='tname3' id='tname3' size='7' value='' /></div>"
            + " <div class='col-md-1'><input type='text' class='inputs1' name='ttime3' id='ttime3' size='7' value='' /></div>"
            + "</div>";

    Str_Header = "<div class='row'>"
            //+ " <div class='col-md-1'></div>"
            + "<label class='control-label col-md-1 columnlabel1'>ลำดับที่</label>"
            + " <div class='col-md-1'><font color = 'blue'><input type='text' class='inputs1' name='inputH1' id='inputH1' size='7' value='ชนิด'  disabled/></font></div>"
            + " <div class='col-md-1'><font color = 'blue'><input type='text' class='inputs1' name='inputH2' id='inputH2' size='7' value='บิวเทน'  disabled/></font></div>"
            + " <div class='col-md-1'><font color = 'blue'><input type='text' class='inputs1' name='inputH3' id='inputH3' size='7' value='เฉลี่ย'  disabled/></font></div>"
            + " <div class='col-md-1'><font color = 'green'><input type='text' class='inputs1' name='inputH4' id='inputH4' size='7' value='ชนิด'  disabled/></font></div>"
            + " <div class='col-md-1'><font color = 'green'><input type='text' class='inputs1' name='inputH5' id='inputH5' size='7' value='บิวเทน'  disabled/></font></div>"
            + " <div class='col-md-1'><font color = 'green'><input type='text' class='inputs1' name='inputH6' id='inputH6' size='7' value='เฉลี่ย'  disabled/></font></div>"
            + " <div class='col-md-1'><font color = 'red'><input type='text' class='inputs1' name='inputH7' id='inputH7' size='7' value='ชนิด'  disabled/></font></div>"
            + " <div class='col-md-1'><font color = 'red'><input type='text' class='inputs1' name='inputH8' id='inputH8' size='7' value='บิวเทน'  disabled/></font></div>"
            + " <div class='col-md-1'><font color = 'red'><input type='text' class='inputs1' name='inputH9' id='inputH9' size='7' value='เฉลี่ย'  disabled/></font></div>"
            + "</div>";

    //Headerdiv.innerHTML = Str_Info_Header + Str_Info_Detail + Str_Header ;   
    Headerdiv.innerHTML = Str_Info_Detail + Str_Header ;   
    document.getElementById(divName).appendChild(Headerdiv);


}

function addInput(divName) {
    var counter = 1;
    var limit = 24;

    var newdiv = document.createElement('div');

    //newdiv.innerHTML = "Entry " + (counter + 1) + " <br><input class='inputs1' type='text' name='myInputs_'>";   
    /*
     Str_Info_Header = "<div class='row'>"
     //+ " <div class='col-md-1'></div>"                
     + "<label class='control-label col-md-1 columnlabel1'></label>"
     + " <div class='col-md-1'><font color = 'blue'><input type='text' class='inputs1' name='inputH1' id='inputH1' size='7' value='วันที่'  disabled/></font></div>"
     + " <div class='col-md-1'><font color = 'blue'><input type='text' class='inputs1' name='inputH2' id='inputH2' size='7' value='เตา'  disabled/></font></div>"
     + " <div class='col-md-1'><font color = 'blue'><input type='text' class='inputs1' name='inputH3' id='inputH3' size='7' value='เวลา (น.)'  disabled/></font></div>"
     + " <div class='col-md-1'><font color = 'green'><input type='text' class='inputs1' name='inputH4' id='inputH4' size='7' value='วันที่'  disabled/></font></div>"
     + " <div class='col-md-1'><font color = 'green'><input type='text' class='inputs1' name='inputH5' id='inputH5' size='7' value='เตา'  disabled/></font></div>"
     + " <div class='col-md-1'><font color = 'green'><input type='text' class='inputs1' name='inputH6' id='inputH6' size='7' value='เวลา (น.)'  disabled/></font></div>"
     + " <div class='col-md-1'><font color = 'red'><input type='text' class='inputs1' name='inputH7' id='inputH7' size='7' value='วันที่'  disabled/></font></div>"
     + " <div class='col-md-1'><font color = 'red'><input type='text' class='inputs1' name='inputH8' id='inputH8' size='7' value='เตา'  disabled/></font></div>"
     + " <div class='col-md-1'><font color = 'red'><input type='text' class='inputs1' name='inputH9' id='inputH9' size='7' value='เวลา (น.)'  disabled/></font></div>"
     + "</div>";
     
     Str_Info_Detail = "<div class='row'>"
     //+ "<div class='col-md-1'></div>"
     + "<label class='control-label col-md-1 columnlabel1'></label>"
     + " <div class='col-md-1'><input type='text' class='inputs1' name='tdate1' id='tdate1' size='7' value='' /></div>"
     + " <div class='col-md-1'><input type='text' class='inputs1' name='tname1' id='tname1' size='7' value='' /></div>"
     + " <div class='col-md-1'><input type='text' class='inputs1' name='ttime1' id='ttime1' size='7' value='' /></div>"
     + " <div class='col-md-1'><input type='text' class='inputs1' name='tdate2' id='tdate2' size='7' value='' /></div>"
     + " <div class='col-md-1'><input type='text' class='inputs1' name='tname2' id='tname2' size='7' value='' /></div>"
     + " <div class='col-md-1'><input type='text' class='inputs1' name='ttime2' id='ttime2' size='7' value='' /></div>"
     + " <div class='col-md-1'><input type='text' class='inputs1' name='tdate3' id='tdate3' size='7' value='' /></div>"
     + " <div class='col-md-1'><input type='text' class='inputs1' name='tname3' id='tname3' size='7' value='' /></div>"
     + " <div class='col-md-1'><input type='text' class='inputs1' name='ttime3' id='ttime3' size='7' value='' /></div>"
     + "</div>";
     
     Str_Header = "<div class='row'>"
     //+ " <div class='col-md-1'></div>"
     + "<label class='control-label col-md-1 columnlabel1'>ลำดับที่</label>"
     + " <div class='col-md-1'><font color = 'blue'><input type='text' class='inputs1' name='inputH1' id='inputH1' size='7' value='ชนิด'  disabled/></font></div>"
     + " <div class='col-md-1'><font color = 'blue'><input type='text' class='inputs1' name='inputH2' id='inputH2' size='7' value='บิวเทน'  disabled/></font></div>"
     + " <div class='col-md-1'><font color = 'blue'><input type='text' class='inputs1' name='inputH3' id='inputH3' size='7' value='เฉลี่ย'  disabled/></font></div>"
     + " <div class='col-md-1'><font color = 'green'><input type='text' class='inputs1' name='inputH4' id='inputH4' size='7' value='ชนิด'  disabled/></font></div>"
     + " <div class='col-md-1'><font color = 'green'><input type='text' class='inputs1' name='inputH5' id='inputH5' size='7' value='บิวเทน'  disabled/></font></div>"
     + " <div class='col-md-1'><font color = 'green'><input type='text' class='inputs1' name='inputH6' id='inputH6' size='7' value='เฉลี่ย'  disabled/></font></div>"
     + " <div class='col-md-1'><font color = 'red'><input type='text' class='inputs1' name='inputH7' id='inputH7' size='7' value='ชนิด'  disabled/></font></div>"
     + " <div class='col-md-1'><font color = 'red'><input type='text' class='inputs1' name='inputH8' id='inputH8' size='7' value='บิวเทน'  disabled/></font></div>"
     + " <div class='col-md-1'><font color = 'red'><input type='text' class='inputs1' name='inputH9' id='inputH9' size='7' value='เฉลี่ย'  disabled/></font></div>"
     + "</div>";
     
     */

    for (counter = 1; counter <= limit; counter++) {
        Str_Detail = "<div class='row'>"
                //+ "<div class='col-md-1'><input type='checkbox' class='' name='chk_box_' id='chk_box_'/></div>"
                + "<label class='control-label col-md-1 columnlabel1'>" + counter + "</label>"
                + " <div class='col-md-1'><input type='text' class='inputs1' name='c_type1_' " + counter + "id='c_type1_'" + counter + " size='7' value= " + (getId("c_type").value) + " /></div>"
                + " <div class='col-md-1'><input type='text' class='inputs1' name='bu1_' " + counter + "id='bu1_'" + counter + " size='7' value='' /></div>"
                + " <div class='col-md-1'><input type='text' class='inputs1' name='avg1_' " + counter + "id='avg1_'" + counter + " size='7' value='' /></div>"
                + " <div class='col-md-1'><input type='text' class='inputs1' name='c_type2_' " + counter + "id='c_type2_'" + counter + " size='7' value= " + (getId("c_type").value) + " /></div>"
                + " <div class='col-md-1'><input type='text' class='inputs1' name='bu2_' " + counter + "id='bu2_'" + counter + " size='7' value='' /></div>"
                + " <div class='col-md-1'><input type='text' class='inputs1' name='avg2_' " + counter + "id='avg2_'" + counter + " size='7' value='' /></div>"
                + " <div class='col-md-1'><input type='text' class='inputs1' name='c_type3_' " + counter + "id='c_type3_'" + counter + " size='7' value= " + (getId("c_type").value) + " /></div>"
                + " <div class='col-md-1'><input type='text' class='inputs1' name='bu3_' " + counter + "id='bu3_'" + counter + " size='7' value='' /></div>"
                + " <div class='col-md-1'><input type='text' class='inputs1' name='avg3_' " + counter + "id='avg3_'" + counter + " size='7' value='' /></div>"
                + "</div>";

        newdiv.innerHTML = newdiv.innerHTML + Str_Detail;

    }    

    document.getElementById(divName).appendChild(newdiv);
}