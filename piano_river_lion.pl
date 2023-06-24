#!/usr/bin/perl

# Construction Project Management Tool

# This tool will provide a suite of tools for managing and tracking any construction project.

use strict;
use warnings;

# Create a blank project
my $project = {};

# Set project name
$project->{'name'} = "My Construction Project";

# Add a list of project stakeholders
$project->{'stakeholders'} = [
	"General Contractor",
	"Architect",
	"Owner"
];

# Set the project address
$project->{'address'} = {
	'street'  => "123 Main Street",
	'city'    => "New York City",
	'state'   => 'NY',
	'zipcode' => "10001" 
};

# Add a list of project tasks
$project->{'tasks'} = [
	"Permit Acquisition",
	"Foundation Preparation",
	"Framing and Rough-ins",
	"Finish Work",
	"Inspections"
];

# Add a list of project sub-tasks
$project->{'subtasks'} = {
	"permit_acquisition" => [
		"Drawings",
		"Material Compliance",
		"Submit Application"
	],
	"foundation_preparation" => [
		"Excavation",
		"Rebar",
		"Pouring"
	],
	"framing_and_rough-ins" => [
		"Floor Framing",
		"Wall Framing",
		"Plumbing Rough-in",
		"Electrical Rough-in"
	],
	"finish_work" => [
		"Installing Insulation",
		"Finishing Drywall",
		"Fitting Doors and Windows"
	],
	"inspections" => [
		"Foundation",
		"Rough-in",
		"Final"
	]
};

# Add a list of project resources
$project->{'resources'} = [
	"Equipment",
	"Labour",
	"Materials"
];

# Set the project budget
$project->{'budget'} = {
	'estimated' => "200,000",
	'actual'    => "200,300"
};

# Set the project timeline
$project->{'timeline'} = {
	'start' => "Sep 4 2018",
	'end'   => "Feb 12 2019" 
};

# Set the project completion status
$project->{'status'} = "Complete";

# Add a list of project notes
$project->{'notes'} = [
	"Foundation needs additional support",
	"Delay in permit acquisition"
];

# Function to add a new task
sub add_task {
	my ($project, $task) = @_;
	push( @{$project->{'tasks'}}, $task );
	return "Task Added";
}

# Function to add a new note
sub add_note {
	my ($project, $note) = @_;
	push( @{$project->{'notes'}}, $note );
	return "Note Added";
}

# Function to add a new stakeholder
sub add_stakeholder {
	my ($project, $stakeholder) = @_;
	push( @{$project->{'stakeholders'}}, $stakeholder );
	return "Stakeholder Added";
}

# Function to list all project tasks
sub list_tasks {
	my ($project) = @_;
	print "Task List:\n";
	foreach my $task (@{$project->{'tasks'}}) {
		print "$task\n";
	}
}

# Function to list all project notes
sub list_notes {
	my ($project) = @_;
	print "Note List:\n";
	foreach my $note (@{$project->{'notes'}}) {
		print "$note\n";
	}
}

# Function to list all project stakeholders
sub list_stakeholders {
	my ($project) = @_;
	print "Stakeholder List:\n";
	foreach my $stakeholder (@{$project->{'stakeholders'}}) {
		print "$stakeholder\n";
	}
}

# Function to list the current project budget
sub list_budget {
	my ($project) = @_;
	print "Current Budget:\n";
	foreach my $type (keys %{$project->{'budget'}}) {
		print "$type: $project->{'budget'}->{$type}\n";
	}
}

# Function to list the current project timeline
sub list_timeline {
	my ($project) = @_;
	print "Project Timeline:\n";
	foreach my $date (keys %{$project->{'timeline'}}) {
		print "$date: $project->{'timeline'}->{$date}\n";
	}
}

# Function to list the current project status
sub list_status {
	my ($project) = @_;
	print "Project Status: $project->{'status'}\n";
}

# Function to list all project resources
sub list_resources {
	my ($project) = @_;
	print "Resource List:\n";
	foreach my $resource (@{$project->{'resources'}}) {
		print "$resource\n";
	}
}

# Function to list all project sub-tasks
sub list_subtasks {
	my ($project) = @_;
	print "Sub-task List:\n";
	foreach my $task (keys %{$project->{'subtasks'}}) {
		print "Task: $task\n";
		foreach my $subtask (@{$project->{'subtasks'}->{$task}}) {
			print "\t$subtask\n";
		}
	}
}

# Function to update the project budget
sub update_budget {
	my ($project, $type, $amount) = @_;
	if (exists $project->{'budget'}->{$type}) {
		$project->{'budget'}->{$type} = $amount;
		return "Budget Updated";
	}
	else {
		return "Budget Type Not Found";
	}
}

# Function to update the project timeline
sub update_timeline {
	my ($project, $date, $timestamp) = @_;
	if (exists $project->{'timeline'}->{$date}) {
		$project->{'timeline'}->{$date} = $timestamp;
		return "Timeline Updated";
	}
	else {
		return "Timeline Date Not Found";
	}
}

# Function to update the project completion status
sub update_status {
	my ($project, $status) = @_;
	$project->{'status'} = $status;
	return "Status Updated";
}

# Function to update the project address
sub update_address {
	my ($project, $street, $city, $state, $zipcode) = @_;
	$project->{'address'} = {
		'street'  => $street,
		'city'    => $city,
		'state'   => $state,
		'zipcode' => $zipcode
	};
	return "Address Updated";
}

# Function to update a project stakeholder
sub update_stakeholder {
	my ($project, $old_stakeholder, $new_stakeholder) = @_;
	my $updated = 0;
	
	foreach my $stakeholder (@{$project->{'stakeholders'}}) {
		if ($stakeholder eq $old_stakeholder) {
			$stakeholder = $new_stakeholder;
			$updated = 1;
		}
	}

	if ($updated) {
		return "Stakeholder Updated";
	}
	else {
		return "Stakeholder Not Found";
	}
}

# Function to delete a project task
sub delete_task {
	my ($project, $task) = @_;
	my @tasks = grep { $_ ne $task } @{$project->{'tasks'}};
	$project->{'tasks'} = \@tasks;
	return "Task Deleted";
}

# Function to delete a project note
sub delete_note {
	my ($project, $note) = @_;
	my @notes = grep { $_ ne $note } @{$project->{'notes'}};
	$project->{'notes'} = \@notes;
	return "Note Deleted";
}

# Function to delete a project stakeholder
sub delete_stakeholder {
	my ($project, $stakeholder) = @_;
	my @stakeholders = grep { $_ ne $stakeholder } @{$project->{'stakeholders'}};
	$project->{'stakeholders'} = \@stakeholders;
	return "Stakeholder Deleted";
}

# Function to delete a project resource
sub delete_resource {
	my ($project, $resource) = @_;
	my @resources = grep { $_ ne $resource } @{$project->{'resources'}};
	$project->{'resources'} = \@resources;
	return "Resource Deleted";
}

# Function to delete a project sub-task
sub delete_subtask {
	my ($project, $task, $subtask) = @_;
	my @subtasks = grep { $_ ne $subtask } @{$project->{'subtasks'}->{$task}};
	$project->{'subtasks'}->{$task} = \@subtasks;
	return "Sub-task Deleted";
}