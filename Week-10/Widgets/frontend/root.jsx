/** @format */

import React from 'react';
import Clock from './clock';
import Tabs from './tabs';

const tabs = [
	{title: 'one', content: 'heres first content'},
	{title: 'two', content: 'heres second content'},
	{title: 'three', content: 'heres third content'},
];

const Root = function () {
	return (
		<div>
			<Clock />
			<div className="lowers">
				<Tabs tabs={tabs} /> 
				<div></div>
			</div>
		</div>
	);
};

// {title: 'val', content: 'val'}
export default Root;
