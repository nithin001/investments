import React from 'react';
import {uniq} from "lodash";
import Target from "./Target";
function Targets({ investments, targets }) {
    const uniqueMemberIds = uniq(targets.map(target=>target.member_id));
    return uniqueMemberIds.map(memberId=>{
        const memberInvestments = investments.filter(investment=>investment.member_id === memberId);
        const memberTargets = targets.filter(target=>target.member_id===memberId);
        return <Target investments={memberInvestments} targets={memberTargets} />
    })
}

export default Targets;