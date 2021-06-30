import React from 'react';
import {Chart} from "react-google-charts";
import {uniq} from "lodash";
const titles = {
    'investable_type': 'Type of investment',
    'member': 'Member',
    'financial_year': 'Financial Year'
}

function Breakup({ investments, type, value }) {
    const breakupType = type ? type : 'investable_type';
    const valueType = value ? value : 'buy_value';
    const investmentTypes = uniq(investments.map(investment=>investment[breakupType]));
    const data = investmentTypes.map(investmentType=> {
        const total = investments
            .filter(investment=>investment[breakupType] === investmentType)
            .map(investment=>Math.round(parseFloat(investment[valueType]), 2))
            .reduce((buy, sum)=> (buy + sum), 0);
        return [investmentType+'', total];
    });

    return (
        <Chart
            width={'400px'}
            height={'350px'}
            chartType="PieChart"
            loader={<div>Loading Chart</div>}
            data={[
                ['Investment Type', 'Total'],
                ...data
            ]}
            options={{
                title: `Breakup by ${titles[breakupType]}`,
                pieSliceText: 'value'
            }}
            style={{display: 'inline-block'}}
        />
    );
}

export default Breakup;