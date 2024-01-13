--星宵龙转
function c101202079.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_TOEXTRA+CATEGORY_SPECIAL_SUMMON)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetProperty(EFFECT_FLAG_CARD_TARGET)
	e1:SetHintTiming(0,TIMINGS_CHECK_MONSTER+TIMING_END_PHASE)
	e1:SetCountLimit(1,101202079+EFFECT_COUNT_CODE_OATH)
	e1:SetTarget(c101202079.target)
	e1:SetOperation(c101202079.operation)
	c:RegisterEffect(e1)
end
function c101202079.filter1(c)
	return c:IsFaceup() and (c:IsType(TYPE_FUSION) or c:IsType(TYPE_SYNCHRO) or c:IsType(TYPE_XYZ) or c:IsType(TYPE_LINK)) and c:IsAbleToExtra()
end
function c101202079.filter2(c,tc,e,tp)
	return c:IsType(TYPE_MONSTER) and c:IsCanBeSpecialSummoned(e,0,tp,false,false)
		and ((tc:IsType(TYPE_FUSION) and tc:GetAttribute()==c:GetAttribute())
		or (tc:IsType(TYPE_SYNCHRO) and c:IsLevelBelow(tc:GetLevel()))
		or (tc:IsType(TYPE_XYZ) and tc:GetRank()==c:GetLevel())
		or (tc:IsType(TYPE_LINK) and tc:GetRace()==c:GetRace()))
end
function c101202079.target(e,tp,eg,ep,ev,re,r,rp,chk,chkc)
	if chkc then return chkc:IsFaceup() and chkc:IsLocation(LOCATION_MZONE) and c101202079.filter1(chkc) end
	if chk==0 then return Duel.IsExistingTarget(c101202079.filter1,tp,LOCATION_MZONE,LOCATION_MZONE,1,nil) end
	Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TARGET)
	local g=Duel.SelectTarget(tp,c101202079.filter1,tp,LOCATION_MZONE,LOCATION_MZONE,1,1,nil,e,tp)
	Duel.SetOperationInfo(0,CATEGORY_TOEXTRA,g:GetFirst(),1,0,0)
	if Duel.IsExistingTarget(c101202079.filter2,tp,LOCATION_MZONE,LOCATION_MZONE,1,nil,g:GetFirst(),e,tp) then
		Duel.SetOperationInfo(0,CATEGORY_SPECIAL_SUMMON,nil,1,tp,LOCATION_GRAVE)
	end
end
function c101202079.operation(e,tp,eg,ep,ev,re,r,rp)
	local tc=Duel.GetFirstTarget()
	if tc:IsRelateToEffect(e) and Duel.SendtoDeck(tc,nil,SEQ_DECKSHUFFLE,REASON_EFFECT)~=0 and tc:IsLocation(LOCATION_EXTRA)
		and Duel.GetLocationCount(tp,LOCATION_MZONE)>0
		and Duel.IsExistingMatchingCard(aux.NecroValleyFilter(c101202079.filter2),tp,LOCATION_GRAVE,0,1,nil,tc,e,tp)
		and Duel.SelectYesNo(tp,aux.Stringid(101202079,1)) then
		Duel.BreakEffect()
		Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_SPSUMMON)
		local g=Duel.SelectMatchingCard(tp,aux.NecroValleyFilter(c101202079.filter2),tp,LOCATION_GRAVE,0,1,1,nil,tc,e,tp)
		Duel.SpecialSummon(g,0,tp,tp,false,false,POS_FACEUP)
	end
end