import React from 'react';
import moment from 'moment';
import {Chart} from "react-google-charts";

function Target({ investments, targets }) {
    if(targets.length === 0) {
        return null;
    }

    const yearlyTarget = targets[0].value;
    const monthlyTarget = Math.round(yearlyTarget / 12);
    const startMonth = moment('04-01-2020');
    const endDate = moment('04-01-2022');
    const targetLine = [];
    let month = startMonth;
    let cumulativeTarget = 0;
    let cumulativeBuyValue = 0;
    let cumulativeCurrentValue = 0;
    while(month.isBefore(endDate)) {
        const text = month.format("YYYY-MMM");
        month.add(1, 'months');
        cumulativeTarget+=monthlyTarget;
        const investmentsForMonth = investments.filter(investment=>{
            const boughtOnMonth = moment(investment.bought_on).format("YYYY-MMM");
            return boughtOnMonth===text
        })
        cumulativeBuyValue = investmentsForMonth
            .map(investment=>Math.round(parseFloat(investment.buy_value)))
            .reduce((buyValue, sum)=>(buyValue+sum),cumulativeBuyValue);
        cumulativeCurrentValue = investmentsForMonth
            .map(investment=>Math.round(parseFloat(investment.current_value)))
            .reduce((buyValue, sum)=>(buyValue+sum),cumulativeCurrentValue);
        targetLine.push([text, cumulativeTarget, cumulativeBuyValue, cumulativeCurrentValue])
    }
    return (
        <Chart
            width={'300px'}
            height={'300px'}
            chartType="LineChart"
            loader={<div>Loading Chart</div>}
            data={[
                ['Month', 'Target', 'Buy', 'Current'],
                ...targetLine
            ]}
            options={{
                hAxis: {
                    title: 'Time',
                },
                vAxis: {
                    title: 'Value',
                },
                series: {
                    1: { curveType: 'function' },
                },
            }}
            rootProps={{ 'data-testid': '2' }}
            style={{display: 'inline-block'}}
        />
    );
}

export default Target;