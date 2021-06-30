import React from 'react';
import Breakup from "./Breakup";
import Targets from "./Targets";

function App({ investments, targets }) {
    const parsedInvestments = JSON.parse(investments);
    return (
        <React.Fragment>
            <div>
                <Breakup investments={parsedInvestments} type={'investable_type'}></Breakup>
                <Breakup investments={parsedInvestments} type={'member'}></Breakup>
                <Breakup investments={parsedInvestments} type={'financial_year'}></Breakup>
            </div>
            <div>
                <Targets investments={parsedInvestments} targets={targets}></Targets>
            </div>
        </React.Fragment>
    );
}

export default App;