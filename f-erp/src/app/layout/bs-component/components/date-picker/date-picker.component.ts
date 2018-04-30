import { Component, OnInit } from '@angular/core';

@Component({
    selector: 'app-date-picker',
    templateUrl: './date-picker.component.html',
    styleUrls: ['./date-picker.component.scss']
})
export class DatePickerComponent implements OnInit {
    model: any = 0;
    constructor() {  }

    ngOnInit() {
		
    }
	private muestroFecha()
	{
		console.log(this.model)
	}
	

}
