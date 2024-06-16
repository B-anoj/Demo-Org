import { LightningElement, api, track } from 'lwc';

const statusOptions = [
    { label: 'Not Started', value: 'Not Started' },
    { label: 'In Progress', value: 'In Progress' },
    { label: 'Completed', value: 'Completed' },
    { label: 'Deferred', value: 'Deferred' }
];

export default class TaskUpdateForm extends LightningElement {
    @api tasks;
    @track statusOptions = statusOptions;

    handleStatusChange(event, taskId) {
        const selectedStatus = event.detail.value;
        // Find the task by Id in the tasks array and update its status
        const updatedTasks = this.tasks.map(task => {
            if (task.Id === taskId) {
                return { ...task, Status: selectedStatus };
            }
            return task;
        });

        // Update the tasks array with the modified task
        this.tasks = updatedTasks;
    }
}