import { LightningElement, track } from 'lwc';
import getSumResult from '@salesforce/apex/awe.getSumResult'
export default class CalculateNumber extends LightningElement {
    @track fNumber;
    @track sNumber;
    @track sum;
    @track errors;
    handleClick(){
        getSumResult({firstNumber:this.fNumber,secondNumber:this.sNumber})
        .then(result=>{
            this.sum = result;
        })
        .catch(error=>{
            this.errors = error;
        })
    }
    handleChange(event){
        if(event.target.name === 'frstNumber'){
            this.fNumber = event.target.value;
        } else if(event.target.name === 'scdNumber'){
            this.sNumber = event.target.value;
        }
    }
}